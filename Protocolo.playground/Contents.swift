import UIKit

protocol Imprimivel{
    func imprimir()
    //pegar conteudo -> String
}

class Contrato: Imprimivel{
    func imprimir() {
        //var numeroClausulas: Int = 45
        print("Sou um contrato muito legal")
    }
}

class Foto: Imprimivel{
    var resolucao: String = "16 megapixel"
    func imprimir() {
        print("Sou uma selfie")
    }
}

class Documento: Imprimivel{
    var idioma: String = "Portugues"
    func imprimir() {
        print("Sou um documento do world")
    }
}


class Impressora{
    private var arrayImprimiveis = [Imprimivel]()
    
    func imprimirTudo(){
        for item in arrayImprimiveis {
            item.imprimir()
        }
    }
    
    func agregarImprimivel(imprimivel: Imprimivel){
        arrayImprimiveis.append(imprimivel)
    }
    
    
}

let impressoraHp = Impressora()
impressoraHp.agregarImprimivel(imprimivel: Contrato())
impressoraHp.agregarImprimivel(imprimivel: Foto())
impressoraHp.agregarImprimivel(imprimivel: Documento())
impressoraHp.imprimirTudo()




