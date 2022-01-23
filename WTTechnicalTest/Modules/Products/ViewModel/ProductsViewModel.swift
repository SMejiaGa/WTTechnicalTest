//
//  ProductsViewModel.swift
//  WTTechnicalTest
//
//  Created by Sebastian Mejia on 21/01/22.
//

import Foundation
import UIKit

enum ProductsViewModelState {
    case idle
    case loading
    case dataLoaded
    case error(error: String)
}

class ProductsViewModel {
    
    var stateDidChange: ((ProductsViewModelState) -> Void)?
    private(set) var productList = [FinalProduct]()
    private let productService = ProductService()
    
    private var status: ProductsViewModelState = .idle {
        didSet {
            DispatchQueue.main.async {
                self.stateDidChange?(self.status)
            }
        }
    }
    
    func fetchProductList() {
        status = .loading
        productService.getProducts { [weak self] productData in
            DispatchQueue.main.async {
                productData.forEach( { product in
                    let imageUrl = URL(string: product.ImageUrl)
                    let data = FinalProduct(
                        name: product.Name,
                        description: product.Description,
                        image: (self?.downloadImage(from: imageUrl ?? .init(fileURLWithPath: "")))!
                    )
                    self?.productList.append(data)
                })
                self?.status = .dataLoaded
            }
        }
    }
    
    func getImageData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) -> UIImage {
        var image: UIImage?
        getImageData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                return image = UIImage(data: data) ?? .init()
            }
        }
        return UIImage(named: "stock")!
    }
}
