//
//  TextFieldConfirmations.swift
//  WTTechnicalTest
//
//  Created by Sebastian Mejia on 24/01/22.
//

import Foundation
import UIKit

class TextFieldConfirmations {
    static func isValidEmail(_ email: String) -> Bool {
       let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
       let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
       return emailPred.evaluate(with: email)
   }
    
    static func isLenghtValid(_ textField: UITextField, validNumber: Int) -> Bool {
        guard let safeText = textField.text else {
               return false
           }
        return safeText.count >= validNumber 
    }
}
