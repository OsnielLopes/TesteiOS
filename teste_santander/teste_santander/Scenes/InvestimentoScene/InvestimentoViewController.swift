//
//  InvestimentoViewController.swift
//  teste_santander
//
//  Created by Osniel Lopes Teixeira on 23/04/2018.
//  Copyright (c) 2018 Osniel Lopes Teixeira. All rights reserved.
//

import UIKit

protocol InvestimentoViewControllerInput {
    func display(viewModel: InvestimentoViewModel)
}

protocol InvestimentoViewControllerOutput {
    func perform(request: InvestimentoRequest)
}

class InvestimentoViewController: UITableViewController, InvestimentoViewControllerInput
{
    
  var output: InvestimentoViewControllerOutput!
  var router: (NSObjectProtocol & InvestimentoRoutingLogic & InvestimentoDataPassing)!

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    InvestimentoConfigurator.shared().configure(viewController: self)
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    InvestimentoConfigurator.shared().configure(viewController: self)
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = InvestimentoRequest()
    output.perform(request: request)
  }
  
  func display(viewModel: InvestimentoViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}
