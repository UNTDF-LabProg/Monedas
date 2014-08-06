
import app.Grupo
import app.Usuario
import app.Moneda
import app.Registro

class BootStrap
{
    def init = { servletContext ->   
            new Grupo
            (
                nombre:'publico',
                isAdmin:false
            ).addToUsuarios(new Usuario
            (
                  nombre:'Jonatan',
                  apellido:'Quintero',
                  password: "12345678",
                  dni: 36303191,
                  email: 'joni1692@hotmail.com'
            )).save()
            new Grupo
            (
                nombre:'administrador',
                isAdmin:true
            ).addToUsuarios(new Usuario
            (
                  nombre:'Kukagres',
                  apellido:'Salkute',
                  password: "1234567",
                  dni: 38087818,
                  email: 'kukagres07@hotmail.com'
            ).addToMonedas(new Moneda(siglas:"ARS", valorActual:8.23)
            ).addToMonedas(new Moneda(siglas:"AED", valorActual:13.23)
            ).addToRegistros(new Registro(siglas:"AED", cambio:16.23,fechaActualizacion:new Date())
            ).addToRegistros(new Registro(siglas:"ARS", cambio:6.23,fechaActualizacion:new Date())
            ).addToRegistros(new Registro(siglas:"AED", cambio:13.23,fechaActualizacion:new Date())            
            ).addToRegistros(new Registro(siglas:"ARS", cambio:8.23,fechaActualizacion:new Date())
            )).save()
    }
    
    def destroy = {
    }
}