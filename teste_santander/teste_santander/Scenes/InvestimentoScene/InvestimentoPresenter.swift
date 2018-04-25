//
//  InvestimentoPresenter.swift
//  teste_santander
//
//  Created by Osniel Lopes Teixeira on 23/04/2018.
//  Copyright (c) 2018 Osniel Lopes Teixeira. All rights reserved.
//

import UIKit

protocol InvestimentoPresenterInput {
  func present(response: InvestimentoResponse)
}

protocol InvestimentoPresenterOutput: AnyObject {
    func display(viewModel: InvestimentoViewModel)
}

class InvestimentoPresenter: InvestimentoPresenterInput
{
  weak var output: InvestimentoPresenterOutput!
  
  // MARK: Do something
  
  func present(response: InvestimentoResponse)
  {
    let viewModel = InvestimentoViewModel()
    output.display(viewModel: viewModel)
  }
}
