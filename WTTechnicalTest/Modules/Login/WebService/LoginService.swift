//
//  LoginService.swift
//  WTTechnicalTest
//
//  Created by Sebastian Mejia on 22/01/22.
//

import Foundation
import Alamofire

class LoginService {
    
    // MARK: - Properties
    private let serverEndpoint = "http://ws4.shareservice.co/TestMobile/rest/Login."
    
    // MARK: - Internal methods
    func postLogin(
        user: UserRequest,
        onFinished: @escaping (Int) -> Void
    ) {
        AF.request(
            serverEndpoint,
            method: .post,
            parameters: nil,
            headers: nil
        ).responseDecodable { (res: DataResponse<UserResponse, AFError>) in
            onFinished(res.value?.ExpirationDate ?? 1)
        }
    }
}
