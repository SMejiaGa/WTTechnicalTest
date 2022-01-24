//
//  LoginViewModel.swift
//  WTTechnicalTest
//
//  Created by Sebastian Mejia on 21/01/22.
//

import Foundation

enum LoginViewModelState {
    case idle
    case loading
    case authenticationSuccessful
    case error(error: String)
}

class LoginViewModel {
    
    // MARK: - properties
    var stateDidChange: ((LoginViewModelState) -> Void)?
    private let loginService = LoginService()
    private var userName: String?
    private var userPassword: String?
    
    private var status: LoginViewModelState = .idle {
        didSet {
            DispatchQueue.main.async {
                self.stateDidChange?(self.status)
            }
        }
    }
    
    // MARK: - Internal methods
    func submitLogin(username: String, password: String) {
        status = .loading
        userName = username
        userPassword = password
        requestLogin(user: UserRequest(username: username, password: password))
    }
    
    // MARK: - Public methods
    private func requestLogin(user: UserRequest) {
        loginService.postLogin(user: user) { expirationDate in
            if expirationDate != 0 {
                self.status = .authenticationSuccessful
                print(expirationDate)
            } else {
                self.status = .error(error: "unable to create")
            }
        }
    }
}
