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
    
    func getImageData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}


