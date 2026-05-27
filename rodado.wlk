// se creo una clase, la cual es un molde para crear un objeto especifico.
// La clase se nombre en mayucula, y se le puedo crear todos los metodos que se necesite como carateristicas.
// los objetos que se crean de la clases : no se le puede agregar nuevos metodos.
// 
class Corsa {
  var color  
  method color () = color 
  method capacidad () = 4
  method velocidad () = 150
  method pesos () = 1300
  method pintarDe(unColor) {color = unColor}

  
}

class Kwid {
    var tieneTanqueAdicional
    method capacidad() = if(tieneTanqueAdicional) 3 else 4
    method velocidad() = if(tieneTanqueAdicional) 110 else 120
    method peso() = 1200 + if(tieneTanqueAdicional) 150 else 0
    method color() = "azul"
    method ponerTanqueAdicional() {tieneTanqueAdicional = true}
    method sacarTanqueAdicional() {tieneTanqueAdicional = false}
}

object trafic {
    var interior = comodo
    var motor = pulenta

    method cambiarMotor(unMotor){ motor = unMotor}
    method cambiarInteriror(unInteriro){interior = unInteriro}
    method color() = "blanco"
    method peso() = 4000 + interior.peso() + motor.peso()
    method velocidad () = motor.velocidad()
    method capacidad() = interior.capacidad()
 }

object comodo{
    method capacidad()  = 5

    method peso () = 700
}
object popular{
    method capacidad()  = 12

    method peso () = 1000
}

object pulenta {
    method peso() = 800
    method velocidad () = 130
}

object bataton {
    method peso() = 800
    method velocidad () = 130
}


class AutoEspeciales {
    const property capacidad 
    const property peso
    const property velocidad
    var color
    method pintarDe(unColor) {color = unColor}

}

class Dependencia{
    const flota =[]
    const empleados
    const pedidos = []

    method agregarPedidos(unPedido){
        pedidos.add(unPedido)
    }

    method totalPasajerosEnPedidos(){
        return pedidos.sum({p=>p.cantidadDePasajeros()})

    }
    method unPedidoPuedeSerSatisfechoPor(unPedido){
            return flota.any({a=>unPedido.puedeSatisfacerlo(a)})
    }

    method pedidosQueNoPuedenSerSatisfechos(){
        return pedidos.filter({p=> !self.unPedidoPuedeSerSatisfechoPor(p)})
    }

    method agregarAFlota(unRodado){
        flota.add(unRodado)
    }

    method quitarAflota(unRodado){
        flota.remove(unRodado)
    }

    method pesosTotalDeLaFlota(){
        return flota.sum({r=>r.peso()})
    }

    method estaBienEquipada(){
        return flota.size() > 3 && self.todoPuedeIrA()
    }

    method todoPuedeIrA(){
        return flota.all({r=> r.velocidad() >= 100})
    }

    method capacidadTotalEnColor(color){
        return self.rodadosDelColor(color).sum({r=>r.capacidad()})
    }
    method rodadosDelColor(color){
        return flota.filter({r => r.color()==color})
    }

    method colorDelRodadoMasRapido(){
        return self.rodadoMasRapido().color()
    }

    method rodadoMasRapido() = flota.max({r=>r.velocidad()})

    method capasicadadFaltnate(){
        return empleados - self.capacidadDeFlota()
    }

    method capacidadDeFlota()= flota.sum({f=>f.capacidad()})

    method esGrande()= empleados >= 40 && flota.size() > 5


}

class Pedido {
    const distancia
    var property tiempoMaximo
    var property cantidadDePasajeros
    const coloresIncompatibles = #{}

    method agregarColorIncopatibles(unColor){
        coloresIncompatibles.add(unColor)
    }

    method velocidadRequerida(){
        return distancia.div(tiempoMaximo)
    }
    method puedeSatisfacerlo(unAuto){
        return unAuto.velocidad()>=self.velocidadRequerida() + 10
        && unAuto.capacidad() >= cantidadDePasajeros
        && not coloresIncompatibles.contains(unAuto.color())
    }


}