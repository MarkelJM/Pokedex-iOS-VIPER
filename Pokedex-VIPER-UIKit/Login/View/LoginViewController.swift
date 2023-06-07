//
//  LoginViewController.swift
//  Pokedex-VIPER-UIKit
//
//  Created by Markel Juaristi on 5/6/23.
//

import UIKit

protocol LoginViewControllerProtocol : AnyObject{
    func showError(_ error: Error)

}

class LoginViewController: UIViewController, LoginViewControllerProtocol {
    var presenter : PresenterLoginProtocol?
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        
    }
    
    
    @objc func startButtonTapped() {
        presenter?.startButtonWasPressed()
    }
    
    func showError(_ error: Error) {
        print("Mostrar error: \(error)")
        // mostrar error, pero lo hare mas tarde
    }


    

}
