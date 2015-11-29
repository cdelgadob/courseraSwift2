//: Velocidades Auto

enum Velocidades: Int, CustomStringConvertible {
    case Apagado = 0, VelocidadBaja = 20, VelocidadMedia = 50, VelocidadAlta = 120
    
    init( velocidadInicial : Velocidades ) {
        self = velocidadInicial
    }
    
    var description : String {
        switch self {
            case .Apagado: return "Apagado"
            case .VelocidadBaja: return "VelocidadBaja"
            case .VelocidadMedia: return "VelocidadMedia"
            case .VelocidadAlta: return "VelocidadAlta"
        }
    }
}

class Auto {
    var velocidad: Velocidades
    
    init ( ) {
        self.velocidad = Velocidades(velocidadInicial: Velocidades.Apagado)
    }
    
    func cambioDeVelocidad() -> ( actual : Int, velocidadEnCadena: String) {
        switch (self.velocidad) {
            case Velocidades.Apagado:
                self.velocidad = Velocidades(velocidadInicial: Velocidades.VelocidadBaja)
            case Velocidades.VelocidadBaja:
                self.velocidad = Velocidades(velocidadInicial: Velocidades.VelocidadMedia)
            case Velocidades.VelocidadMedia:
                self.velocidad = Velocidades(velocidadInicial: Velocidades.VelocidadAlta)
            case Velocidades.VelocidadAlta:
                self.velocidad = Velocidades(velocidadInicial: Velocidades.Apagado)
        }
        return (self.velocidad.hashValue, self.velocidad.description)
    }
}


var auto = Auto()

for iteracion in 1...20 {
    print ("\(iteracion). \(auto.cambioDeVelocidad())")
}