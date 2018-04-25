//
//  InvestimentoInteractor.swift
//  teste_santander
//
//  Created by Osniel Lopes Teixeira on 23/04/2018.
//  Copyright (c) 2018 Osniel Lopes Teixeira. All rights reserved.
//

import UIKit

protocol InvestimentoInteractorInput {
  func perform(request: InvestimentoRequest)
}

protocol InvestimentoInteractorOutput {
    func present(response: InvestimentoResponse)
}

protocol InvestimentoDataStore {
  //var name: String { get set }
}

class InvestimentoInteractor: InvestimentoInteractorInput, InvestimentoDataStore
{
  var output: InvestimentoInteractorOutput!
  var worker: InvestimentoWorker!
  //var name: String = ""
  
  // MARK: Do something
  
  func perform(request: InvestimentoRequest)
  {
    worker = InvestimentoWorker()
    worker?.doSomeWork()
    
    let response = InvestimentoResponse()
    output.present(response: response)
  }
}
