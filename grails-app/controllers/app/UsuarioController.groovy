package app
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UsuarioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static layout="usuario"
      
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Usuario.list(params), model:[usuarioInstanceCount: Usuario.count()]
    }
    
    //De la vista llamo a esta accion, que verifica el logueo
    def login(){
      //  def email= Usuario.findByEmail(params.email)   
      //  def password= Usuario.findByPassword(params.password)   
         def u=Usuario.findWhere(email:params.email, password:params.password)
        //Si no existe el usuario
        if(!u)
        {
            redirect(uri:'/')
        }
        else
        {
            if (u.password==params.password)
            {           
                u.grupos.each{if (it.isAdmin){layout="administrador"}}
                redirect(controller:"Usuario", action:"show", id: u.id, params: [layout: this.layout])  
            }
            else
            {
                redirect(uri:'/')
            }           
        }        
       }
    
    def logout() {
                    if (session.user){
            session.user = null
            render(view:'login')
        }
    }
                
    def show(Usuario usuarioInstance) 
    {
        if (usuarioInstance == null) {
            notFound()
            return
        }
        
        //def model=[:]
        //model[user]=usuarioInstance
        //MonedasService.
        respond usuarioInstance        
    }

    def create() {
        respond new Usuario(params)
        
    }

    @Transactional
    def save(Usuario usuarioInstance) {
        if (usuarioInstance == null) {
            notFound()
            return
        }

        if (usuarioInstance.hasErrors()) {
            respond usuarioInstance.errors, view:'create'
            return
        }
        //Le agrego un tipo Publico    
        def grupo= Grupo.findByNombre("publico")
        //Agrego al Nueso Usuario
        grupo.addToUsuarios(usuarioInstance).save(flush:true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect usuarioInstance
            }
            '*' { respond usuarioInstance, [status: CREATED] }
        }
        

    }

    def edit(Usuario usuarioInstance) {
        respond usuarioInstance
    }

    @Transactional
    def update(Usuario usuarioInstance) {
        if (usuarioInstance == null) {
            notFound()
            return
        }

        if (usuarioInstance.hasErrors()) {
            respond usuarioInstance.errors, view:'edit'
            return
        }

        usuarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect usuarioInstance
            }
            '*'{ respond usuarioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Usuario usuarioInstance) {

        if (usuarioInstance == null) {
            notFound()
            return
        }

        usuarioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
            }
