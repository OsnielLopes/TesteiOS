//
//  ContatoRouter.swift
//  teste_santander
//
//  Created by Osniel Lopes Teixeira on 23/04/2018.
//  Copyright (c) 2018 Osniel Lopes Teixeira. All rights reserved.
//

import UIKit

@objc protocol ContatoRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol ContatoDataPassing
{
  var dataStore: ContatoDataStore? { get }
}

class ContatoRouter: NSObject, ContatoRoutingLogic, ContatoDataPassing
{
  weak var viewController: ContatoViewController?
  var dataStore: ContatoDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: ContatoViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: ContatoDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
