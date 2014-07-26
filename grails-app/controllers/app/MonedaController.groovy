package app

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MonedaController 
{
    static allowedMethods = [save: "POST", update: "PUT", delete: "POST"]
    def monedasService
    
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Moneda.list(params), model:[monedaInstanceCount: Moneda.count()]
    }

    def show(Moneda monedaInstance) {
        respond monedaInstance
    }
    
    def agregar()
    {
        if (session.user)
        {
            def pepito=Usuario.findWhere(email:session.user)
            pepito.addToMonedas(new Moneda(siglas:params.moneda, valorActual:monedasService.getCurrency(params.moneda))).save(flush:true)
            pepito.addToRegistros(new Registro(cambio:monedasService.getCurrency(params.moneda),siglas:params.moneda,fechaActualizacion:new Date())).save(flush:true)
            redirect(controller:"Usuario", action:"show")   
        }
        else
        {
            //redirect to login?
        }
    }

    def create() {
        respond new Moneda(params)
    }

    @Transactional
    def save(Moneda monedaInstance) {
        if (monedaInstance == null) {
            notFound()
            return
        }

        if (monedaInstance.hasErrors()) {
            respond monedaInstance.errors, view:'create'
            return
        }

        monedaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'moneda.label', default: 'Moneda'), monedaInstance.id])
                redirect monedaInstance
            }
            '*' { respond monedaInstance, [status: CREATED] }
        }
    }

    def edit(Moneda monedaInstance) {
        respond monedaInstance
    }

    @Transactional
    def update(Moneda monedaInstance) {
        if (monedaInstance == null) {
            notFound()
            return
        }

        if (monedaInstance.hasErrors()) {
            respond monedaInstance.errors, view:'edit'
            return
        }

        monedaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Moneda.label', default: 'Moneda'), monedaInstance.id])
                redirect monedaInstance
            }
            '*'{ respond monedaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Moneda monedaInstance) {

        if (monedaInstance == null) {
            notFound()
            return
        }

        monedaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Moneda.label', default: 'Moneda'), monedaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'moneda.label', default: 'Moneda'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
