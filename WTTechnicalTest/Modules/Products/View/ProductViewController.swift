//
//  ProductsViewController.swift
//  WideTechIOSTest
//
//  Created by Sebastian Mejia on 20/01/22.
//

import UIKit

class ProductViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var productTable: UITableView!
    @IBAction private func sideButton() {
        showSideAlert()
    }
    
    // MARK: - Properties
    private let customCellView = UINib(nibName: "ProductTableViewCell",
                                       bundle: nil)
    private let viewModel: ProductsViewModel
    private let cellIdentifier = "ProductTableViewCell"
    private let cellReuseIdentifier = "myCell"
    
    // MARK: - Dependencies
    init(viewModel: ProductsViewModel){
        self.viewModel = viewModel
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        subscribeToViewModel()
        viewModel.fetchProductList()
        setupTableView()
    }
    
    // MARK: - Private methods
    private func subscribeToViewModel() {
        viewModel.stateDidChange = { [weak self] status in
            guard let self = self else {
                return
            }
            switch status {
            case .idle:
                return
                
            case .loading:
                self.productTable.isHidden = true
                self.loader.isHidden = false
                
            case .dataLoaded:
                DispatchQueue.main.async {
                    self.productTable.reloadData()
                    self.productTable.isHidden = false
                    self.loader.isHidden = true
                }
            case .error(let error):
                print(error)
                return
            }
        }
    }
    
    private func setupTableView() {
        productTable.separatorStyle = .none
        productTable.delegate = self
        productTable.dataSource = self
        productTable.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        productTable.register(customCellView,
                               forCellReuseIdentifier: cellIdentifier)
    }
    
    private func showSideAlert() {
        
        let alert = UIAlertController(title: Lang.Product.options, message: "", preferredStyle: .actionSheet)
            
        alert.addAction(UIAlertAction(title: Lang.Product.contact, style: .default, handler: { [weak self] _ in
                guard let self = self else { return }
                self.navigationController?.pushViewController(ContactViewController(viewModel: ContactViewModel()), animated: true)
            }))
            
        alert.addAction(UIAlertAction(title: Lang.Product.profile, style: .default, handler: { [weak self] _ in
                
                guard let self = self else { return }
                self.navigationController?.pushViewController(UserProfileViewController(viewModel: UserViewModel()), animated: true)
            }))
        
        alert.addAction(UIAlertAction(title: Lang.Product.logout, style: .destructive, handler: { [weak self] _ in
            
            guard let self = self else { return }
            self.navigationController?.dismiss(animated: true, completion: nil)
        }))
            
        alert.addAction(UIAlertAction(title: Lang.Product.cancel, style: .cancel, handler: nil))
            
            self.present(alert, animated: true, completion: {
            })
    }
}

extension ProductViewController {
    static var instance: UINavigationController {
        return UINavigationController(
            rootViewController: ProductViewController(
                viewModel: ProductsViewModel()
            )
        )
    }
}

extension ProductViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ProductTableViewCell {
            cell.configCell(
                name: viewModel.productList[indexPath.row].name,
                description: viewModel.productList[indexPath.row].description,
                imageURL: viewModel.productList[indexPath.row].url)
            return cell
        }
        return UITableViewCell()
    }
    
    
}
