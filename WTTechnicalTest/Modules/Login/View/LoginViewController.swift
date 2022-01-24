//
//  LoginViewController.swift
//  WideTechIOSTest
//
//  Created by Sebastian Mejia on 20/01/22.
//

import UIKit
import SwiftUI

class LoginViewController: UIViewController {
    
    // MARK: - IBoutlets
    @IBOutlet private var loader: UIActivityIndicatorView?
    @IBOutlet var usernameTextfield: UITextField?
    @IBOutlet var passwordTextfield: UITextField?
    @IBOutlet weak var statusLabel: UILabel!
    
    // MARK: - IBActions
    @IBAction private func submitButton() {
        checkLogin()
    }
    
    // MARK: - Properties
    private let viewModel: LoginViewModel

    // MARK: - dependencies
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: Self.self), bundle: .main)
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
 
    // MARK: - ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true 
        subscribeToViewModel()
    }
    
    // MARK: - ViewModel methods
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
    
    // MARK: - Private methods
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
    
    private func checkLogin() {
        if TextFieldConfirmations.isLenghtValid(
            usernameTextfield ?? .init(),
            validNumber: 3
        ) && TextFieldConfirmations.isLenghtValid(
            passwordTextfield ?? .init(),
            validNumber: 6
        ) {
            viewModel.submitLogin(
                username: usernameTextfield?.text ?? .init(),
                password: passwordTextfield?.text ?? .init())
        } else {
            self.statusLabel.text = Lang.Login.TextFieldError
        }
        
    }

}
