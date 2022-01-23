//
//  LoginViewController.swift
//  WideTechIOSTest
//
//  Created by Sebastian Mejia on 20/01/22.
//

import UIKit
import SwiftUI

class LoginViewController: UIViewController {
    @IBOutlet private var loader: UIActivityIndicatorView?
    @IBOutlet var usernameTextfield: UITextField?
    @IBOutlet var passwordTextfield: UITextField?
    
    @IBAction private func submitButton() {
        viewModel.submitLogin(
            username: usernameTextfield?.text ?? .init(),
            password: passwordTextfield?.text ?? .init())
    }
    private let viewModel: LoginViewModel

    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: Self.self), bundle: .main)
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true 
        subscribeToViewModel()
    }
    
    private func subscribeToViewModel() {
        viewModel.stateDidChange = { [weak self] status in
            guard let self = self else {
                return
            }
            switch status {
            case .idle:
                return
                
            case .loading:
                self.loader?.isHidden = false
                self.loader?.startAnimating()
    
            case .authenticationSuccessful:
                self.loader?.isHidden = true
                self.loader?.stopAnimating()
                self.navigateToHome()
                
            case .error(let error):
                print(error)
                return
            }
        }
    }
    
    private func navigateToHome() {
        DispatchQueue.main.async {
            let navigationController = ProductViewController.instance
            navigationController.modalPresentationStyle = .fullScreen
            
            self.present(
                navigationController,
                animated: true,
                completion: nil
            )
        }
    }

}
