//
//  ProductsViewController.swift
//  WideTechIOSTest
//
//  Created by Sebastian Mejia on 20/01/22.
//

import UIKit

class ProductsViewController: UIViewController {
    @IBOutlet weak var productTable: UITableView!
    @IBAction private func sideButton() {
        showSideAlert()
    }
    
    private let customCellView = UINib(nibName: "ProductTableViewCell",
                                       bundle: nil)
    private let viewModel: ProductsViewModel
    private let cellIdentifier = "ProductTableViewCell"
    private let cellReuseIdentifier = "myCell"
    
    init(viewModel: ProductsViewModel){
        self.viewModel = viewModel
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
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
        
            let alert = UIAlertController(title: "Opciones", message: "", preferredStyle: .actionSheet)
            
            alert.addAction(UIAlertAction(title: "Contacto", style: .default, handler: { [weak self] _ in
                guard let self = self else { return }
                self.navigationController?.pushViewController(ContactViewController(viewModel: ContactViewModel()), animated: true)
            }))
            
            alert.addAction(UIAlertAction(title: "Perfil", style: .default, handler: { [weak self] _ in
                
                guard let self = self else { return }
                self.navigationController?.pushViewController(UserProfileViewController(viewModel: UserViewModel()), animated: true)
            }))
        
        alert.addAction(UIAlertAction(title: "Cerrar sesión", style: .destructive, handler: { [weak self] _ in
            
            guard let self = self else { return }
            self.navigationController?.dismiss(animated: true, completion: nil)
        }))
            
            alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
            
            self.present(alert, animated: true, completion: {
            })
    }
}

extension ProductsViewController {
    static var instance: UINavigationController {
        return UINavigationController(
            rootViewController: ProductsViewController(
                viewModel: ProductsViewModel()
            )
        )
    }
}

extension ProductsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ProductTableViewCell {
            cell.productNameLabel.text = "name"
            cell.descriptionlabel.text = "desc"
            return cell
        }
        return UITableViewCell()
    }
    
    
}
