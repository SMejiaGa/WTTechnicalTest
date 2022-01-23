//
//  ProductWebService.swift
//  WTTechnicalTest
//
//  Created by Sebastian Mejia on 23/01/22.
//

import Foundation
import Alamofire
import SwiftUI
typealias ProductServiceResult = ([ProductResponse]) -> Void

class ProductService {
    
    private let serverEndpoint = "http://ws4.shareservice.co/TestMobile/rest/GetProductsData"
    
    func getProducts(onFinished: @escaping ProductServiceResult) {
        AF.request(
            serverEndpoint,
            method: .post,
            parameters: nil,
            headers: nil
        ).responseDecodable { (res: DataResponse<[ProductResponse], AFError>) in
            let responseFromService = res.value ?? []
            onFinished(responseFromService)
        }
    }
}


