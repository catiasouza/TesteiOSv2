//
//  Service.swift
//  Santander
//
//  Created by Cátia Souza on 07/04/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

import UIKit


class Service {
    var bancos: Array<String> = []
    var arrayRecuperado: Array<Any> = []
    
    func api(sucesso:@escaping (_ bancos: Array<String> ) -> Void){
        
        if let url = URL(string: "https://bank-app-test.herokuapp.com/api/statements/1") {
            let tarefa = URLSession.shared.dataTask(with: url) { (dados, requisicao, erro) in
                
                if erro == nil {
                    if let dadosRecebidos = dados {
                        do{
                            let objetoJson = try JSONSerialization.jsonObject(with: dadosRecebidos, options: [] ) as! [String:Any]
                            print(objetoJson)
                            if let arrayBancos = objetoJson["statementList"] as? Array<Any> {
                                
                                let n = arrayBancos.count
                                for i in (0...n-1) {
                                    if let dicionario = arrayBancos[i] as? [String:Any] {
                                        guard let title = dicionario["title"] as? String,
                                            let desc = dicionario["desc"] as? String,
                                            let date = dicionario["date"] as? String,
                                            let value = dicionario["id"] as! Int? else { return }
                                        let auxiliar:Array<Any> = [title, desc, date, value]
                                        self.arrayRecuperado.append(auxiliar)
                                        print(self.arrayRecuperado)
                                        
                                    }
                                }
                                
                                DispatchQueue.main.sync {
                                    sucesso(self.arrayRecuperado as! Array<String>)
                                    print(self.bancos)
                                }
                            }
                        }catch{
                            print("Erro")
                        }
                    }
                }
            }
            tarefa.resume()
        }
    }
    
    
    
}

