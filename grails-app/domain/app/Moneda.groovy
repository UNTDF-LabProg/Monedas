package app

class Moneda 
{
    String siglas
    Float valorActual

    static constraints = 
    {
        siglas(blank:false)
        valorActual(blank:false, scale:2)
    } 
    static belongsTo=[usuario:Usuario]        
}