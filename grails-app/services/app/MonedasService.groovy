package app

import grails.transaction.Transactional
import groovy.json.*
import org.jfree.chart.*
import org.jfree.data.time.*

@Transactional
class MonedasService 
{
    URL url = new URL("http://openexchangerates.org/api/latest.json?app_id=4d7bc29f943f4018b32c151420a88c4b&base=USD");
    Map monedas=[:]   
    
    def MonedasService
    {
        InputStream urlStream = url.openStream();
        BufferedReader reader = new BufferedReader(new InputStreamReader(urlStream));
        JsonSlurper jsonSlurper = new JsonSlurper();
        Object result = jsonSlurper.parse(reader);
        Map jsonResult = (Map) result;
        monedas = (Map) jsonResult.get("rates"); 
        monedas = monedas.sort { it.key }
    }
    
    def updateMonedas()
    {
        InputStream urlStream = url.openStream();
        BufferedReader reader = new BufferedReader(new InputStreamReader(urlStream));
        JsonSlurper jsonSlurper = new JsonSlurper();
        Object result = jsonSlurper.parse(reader);
        Map jsonResult = (Map) result;
        monedas = (Map) jsonResult.get("rates"); 
        monedas = monedas.sort { it.key }        
    }
    
    def getCurrency(String c)
    {        
        this.monedas[c].floatValue().round(2)
    }
    
    def getMonedas(Usuario user)
    {        
        def monedasUsuario=user.monedas.collect()
        Map monedasCombo=this.monedas
        monedasUsuario.each{
            it -> if (monedasCombo.containsKey(it.siglas))
            {
                monedasCombo.remove(it.siglas)                
            }          
        }
        return monedasCombo       
    }   
    
    def getCambios(Usuario user)
    {
        this.updateMonedas()
        def monedasUsuario=user.monedas.collect()          
        monedasUsuario.each{
            it -> if (it.valorActual!=this.getCurrency(it.siglas))
            {
                //actualizar 
                def m = Moneda.get(it.id)
                user.addToRegistros(new Registro(cambio:it.valorActual,siglas:it.siglas,fechaActualizacion:new Date())).save(flush:true)
                user.removeFromMonedas(m)
                m.delete(flush: true)
                user.addToMonedas(new Moneda(siglas:it.siglas, valorActual:this.getCurrency(it.siglas))).save(flush:true)
            }          
        }        
    }
    
    def toSecond(Date date)
    {
        def s = new Second(date)
        s
    }
    
    def generarGrafico(Usuario user,String name)
    {
        def registrosUsuario = user.registros.collect()            
        Map registros = [:]
        registrosUsuario.each { it -> def haymoneda=registros.containsKey(it.siglas)
            if (!haymoneda)
            {
               registros[it.siglas]=[:]
            }
            registros[it.siglas].(it.fechaActualizacion)=it.cambio
        } 
        
        registros.each { key , value -> def series = new TimeSeries(key.toString(), Second.class)
            value.each { k , v -> def s = toSecond(k)
                series.add(s, v.doubleValue())
            }            
        }    
        def dataset = new TimeSeriesCollection()
        series.each {dataset.addSeries(it)}
        def chart = ChartFactory.createTimeSeriesChart(
            "Registro de cambios",
            "Fecha",                    // domain axis label
            "Cambio",               // range axis label
            dataset,                   // data
            true,                      // create legend?
            true,                      // generate tooltips? 
            false)                     // generate URLs?
        def file = File.createTempFile("plot", ".jpg")          // create a temporary file to hold the chart image
        ChartUtilities.saveChartAsJPEG(file, chart, 500, 400)   // the file will be 500px wide and 400px tall
        file.renameTo(new File("/web-app/images/grafico.jpg"))
    }
}