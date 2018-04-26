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

class ContatoViewController: UIViewController, ContatoViewControllerInput
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
        switch viewModel {
        case .form(let cells):
            for cell in cells {
                let view = FieldFactory.createField(from: cell, view: self.view)
                self.view.addSubview(view)
            }
            
        }
    }
}

extension UILabel {
    convenience init(cell: Cell, superviewFrame: CGRect){
        let rect = CGRect(x: 0, y: 0, width: superviewFrame.width*0.77, height: 18)
        self.init(frame: rect)
        self.text = cell.message
    }
}

extension UITextField {
    convenience init(cell: Cell) {
        self.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
}

class ImageField: UIImageView {
    init(cell: Cell){
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class Checkbox: UIButton {
    init(cell: Cell){
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class SendButton: UIButton {
    init(cell: Cell) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// Field Factory
protocol Field {
    static func createField(from cell: Cell, view: UIView) -> UIView
}

class FieldFactory: Field {
    static func createField(from cell: Cell, view: UIView) -> UIView {
        switch cell.type {
        case .text:
            let textLabel = UILabel(cell: cell, superviewFrame: view.frame)
            let rigthConstraint = NSLayoutConstraint(item: textLabel, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 20)
            textLabel.addConstraint(rigthConstraint)
            return textLabel
        case .field:
            return UITextField(cell: cell)
        case .image:
            return ImageField(cell: cell)
        case .checkbox:
            return Checkbox(cell: cell)
        case .send:
            return SendButton(cell: cell)
        }
    }
}
