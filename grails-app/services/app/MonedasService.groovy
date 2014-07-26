package app

import grails.transaction.Transactional
import groovy.json.*

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
}