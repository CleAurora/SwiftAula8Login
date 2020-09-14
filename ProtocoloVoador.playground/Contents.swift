import UIKit

protocol Voador{
    func Voar()
}

class Pato: Voador{
    func Voar(){
        print("Estou voando como um pato")
    }
}

class Aviao: Voador{
    func Voar(){
       print("Estou voando como um avião")
    }
}

class SuperHomem: Voador{
    func Voar(){
        print("Estou voandoc como um campeão")
    }
}

class TorreDeControle{
    var arrayVoadores = [Voador]()
    public func voamTodos(){
        for item in arrayVoadores {
            item.Voar()
        }
    }
    public func adicionarVoador(voador: Voador){
        arrayVoadores.append(voador)
    }
}

let serQueVoa = TorreDeControle()
serQueVoa.adicionarVoador(voador: Pato())
serQueVoa.adicionarVoador(voador: Aviao())
serQueVoa.adicionarVoador(voador: SuperHomem())
serQueVoa.voamTodos()
