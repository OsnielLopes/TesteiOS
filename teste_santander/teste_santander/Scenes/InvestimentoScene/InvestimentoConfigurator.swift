//
//  InvestimentoConfigurator.swift
//  teste_santander
//
//  Created by Osniel Lopes Teixeira on 24/04/2018.
//  Copyright © 2018 Osniel Lopes Teixeira. All rights reserved.
//

// MARK: Connect View, Interactor, and Presenter

import UIKit

extension InvestimentoViewController: InvestimentoPresenterOutput
{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
//        router.passDataToNextScene(segue)
    }
}

extension InvestimentoInteractor: InvestimentoViewControllerOutput {}

extension InvestimentoPresenter: InvestimentoInteractorOutput {}

class InvestimentoConfigurator {
    
    // MARK: - Properties
    
    private static var sharedInstance: InvestimentoConfigurator = {
        return InvestimentoConfigurator()
    }()

    
    // MARK: Configuration
    
    func configure(viewController: InvestimentoViewController)
    {
        let router = InvestimentoRouter()
        router.viewController = viewController
        
        let presenter = InvestimentoPresenter()
        presenter.output = viewController
        
        let interactor = InvestimentoInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
    
    class func shared() -> InvestimentoConfigurator {
        return sharedInstance
    }
}
