//
//  ContatoInteractor.swift
//  teste_santander
//
//  Created by Osniel Lopes Teixeira on 23/04/2018.
//  Copyright (c) 2018 Osniel Lopes Teixeira. All rights reserved.
//

import UIKit

protocol ContatoInteractorInput {
    func perform(request: ContatoRequest)
}

protocol ContatoInteractorOutput {
    func present(response: ContatoResponse)
}

protocol ContatoDataStore {
    //var name: String { get set }
}

class ContatoInteractor: ContatoInteractorInput, ContatoDataStore
{
    var output: ContatoInteractorOutput!
    var worker: ContatoWorker!
    //var name: String = ""
    
    // MARK: Do something
    
    func perform(request: ContatoRequest)
    {
        worker = ContatoWorker()
        var response: ContatoResponse!
        switch request {
        case .form:
//            worker.getTheForm(completionHandler: { (cells) in
//                self.output.present(response: ContatoResponse.form(cells))
//            })
            response = ContatoResponse.form(worker.getTheForm())
        }
        output.present(response: response)
    }
    
    
}
