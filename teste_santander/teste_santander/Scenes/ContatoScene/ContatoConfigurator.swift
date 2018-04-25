//
//  ContatoConfigurator.swift
//  teste_santander
//
//  Created by Osniel Lopes Teixeira on 24/04/2018.
//  Copyright © 2018 Osniel Lopes Teixeira. All rights reserved.
//

// MARK: Connect View, Interactor, and Presenter

import UIKit

extension ContatoViewController: ContatoPresenterOutput
{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        //        router.passDataToNextScene(segue)
    }
}

extension ContatoInteractor: ContatoViewControllerOutput {}

extension ContatoPresenter: ContatoInteractorOutput {}

class ContatoConfigurator {
    
    // MARK: - Properties
    
    private static var sharedInstance: ContatoConfigurator = {
        return ContatoConfigurator()
    }()
    
    
    // MARK: Configuration
    
    func configure(viewController: ContatoViewController)
    {
        let router = ContatoRouter()
        router.viewController = viewController
        
        let presenter = ContatoPresenter()
        presenter.output = viewController
        
        let interactor = ContatoInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
    
    class func shared() -> ContatoConfigurator {
        return sharedInstance
    }
}
