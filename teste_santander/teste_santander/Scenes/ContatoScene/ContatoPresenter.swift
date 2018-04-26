//
//  ContatoPresenter.swift
//  teste_santander
//
//  Created by Osniel Lopes Teixeira on 23/04/2018.
//  Copyright (c) 2018 Osniel Lopes Teixeira. All rights reserved.
//

import UIKit

protocol ContatoPresenterInput {
    func present(response: ContatoResponse)
}

protocol ContatoPresenterOutput: AnyObject {
    func display(viewModel: ContatoViewModel)
}

class ContatoPresenter: ContatoPresenterInput
{
    weak var output: ContatoPresenterOutput!
    
    // MARK: Do something
    
    func present(response: ContatoResponse)
    {
        var viewModel: ContatoViewModel!
        switch response {
        case .form(let cells):
            viewModel = ContatoViewModel.form(cells)
        }
        output.display(viewModel: viewModel)
    }
}
