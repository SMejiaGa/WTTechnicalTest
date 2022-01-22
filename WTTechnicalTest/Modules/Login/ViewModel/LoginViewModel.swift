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
    case error(error: Error)
}

class LoginViewModel {
    
    init() {
        
    }
    
    var stateDidChange: ((LoginViewModelState) -> Void)?
    
    private var status: LoginViewModelState = .idle {
        didSet {
            DispatchQueue.main.async {
                self.stateDidChange?(self.status)
            }
        }
    }
    
    private func submitLogin() {
        
    }
}
