//
//  ContatoViewController.swift
//  teste_santander
//
//  Created by Osniel Lopes Teixeira on 23/04/2018.
//  Copyright (c) 2018 Osniel Lopes Teixeira. All rights reserved.
//

import UIKit

protocol ContatoViewControllerInput {
    func display(viewModel: ContatoViewModel)
}

protocol ContatoViewControllerOutput {
    func perform(request: ContatoRequest)
}

class ContatoViewController: UITableViewController, ContatoViewControllerInput
{
    
    var output: ContatoViewControllerOutput!
    var router: (NSObjectProtocol & ContatoRoutingLogic & ContatoDataPassing)!
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        ContatoConfigurator.shared().configure(viewController: self)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        ContatoConfigurator.shared().configure(viewController: self)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        requestForm()
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func requestForm()
    {
        let request = ContatoRequest.form
        output.perform(request: request)
    }
    
    func display(viewModel: ContatoViewModel)
    {
        //nameTextField.text = viewModel.name
    }
}
