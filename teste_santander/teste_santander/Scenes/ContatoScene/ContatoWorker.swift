//
//  ContatoWorker.swift
//  teste_santander
//
//  Created by Osniel Lopes Teixeira on 23/04/2018.
//  Copyright (c) 2018 Osniel Lopes Teixeira. All rights reserved.
//

import UIKit

class ContatoWorker {
    
    struct JSON: Decodable {
        var cells: [Cell]
    }
    
    let url = URL(string: "https://floating-mountain-50292.herokuapp.com/cells.json")
    
    func getTheForm(completionHandler: @escaping ([Cell]) -> Void){
        
        //fetching the data from the url
        URLSession.shared.dataTask(with: url!, completionHandler: {(data, response, error) -> Void in
            
            guard let data = data, error == nil else { return }
            
            do {
                let decoder = JSONDecoder()
                let json = try decoder.decode(JSON.self, from: data)
                completionHandler(json.cells)
            } catch {
                print("error trying to convert data to JSON")
                print(error)
            }
        
        }).resume()
    }
    
    func getTheForm() -> [Cell]{
        
        let cells: [Cell] = [Cell(id: 1, type: Type(rawValue: 2)!, message: "Olá, primeiro se apresente com o seu nome:", typefield: nil, hidden: false, topSpacing: 60.0, show: nil, required: false),
                             Cell(id: 2, type: Type(rawValue: 1)!, message: "Nome Completo", typefield: TypeField(rawValue: 1), hidden: false, topSpacing: 35.0, show: nil, required: true),
                             Cell(id: 4, type: Type(rawValue: 1)!, message: "Email", typefield: TypeField(rawValue: 3), hidden: true, topSpacing: 35.0, show: nil, required: true),
                             Cell(id: 6, type: Type(rawValue: 1)!, message: "Telefone", typefield: TypeField(rawValue: 2), hidden: false, topSpacing: 10.0, show: nil, required: true),
                             Cell(id: 3, type: Type(rawValue: 4)!, message: "Gostaria de cadastrar meu email", typefield: nil, hidden: false, topSpacing: 35.0, show: 4, required: false),
                             Cell(id: 7, type: Type(rawValue: 5)!, message: "Enviar", typefield: nil, hidden: false, topSpacing: 10.0, show: nil, required: true)
                             
                     ]
        return cells
    }
}
