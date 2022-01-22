//
//  LoginViewController.swift
//  WideTechIOSTest
//
//  Created by Sebastian Mejia on 20/01/22.
//

import UIKit

class LoginViewController: UIViewController {
    @IBAction private func submitButton() {
        navigateToHome()
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
        subscribeToViewModel()

    }
    
    private func subscribeToViewModel() {
        viewModel.stateDidChange = { [weak self] status in
            switch status {
            case .idle:
                return
                
            case .loading:
               print("loading")
    
            case .authenticationSuccessful:
                print("done")
                
            case .error(let error):
                print("stop loading")
                print("error")
            }
        }
    }
    
    private func navigateToHome() {
        DispatchQueue.main.async {
            let navigationController = ProductsViewController.instance
            navigationController.modalPresentationStyle = .fullScreen
            
            self.present(
                navigationController,
                animated: true,
                completion: nil
            )
        }
    }

}
