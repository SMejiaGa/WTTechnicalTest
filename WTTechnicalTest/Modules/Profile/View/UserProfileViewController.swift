//
//  UserProfileViewController.swift
//  WTTechnicalTest
//
//  Created by Sebastian Mejia on 20/01/22.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var signatureImage: UIImageView!
    @IBOutlet weak var internalStackView: UIStackView!
    @IBOutlet weak var horizontalInternalStackView: UIStackView!
    
    @IBAction private func backButton() {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func addProfileButton() {
        setupAddButton()
    }
    
    // MARK: - Properties
    private let viewModel: UserViewModel
    private let generalCornerRadius: CGFloat = 15
    private let generalCornerWidth: CGFloat = 2.5
    
    // MARK: - Dependencies
    init(viewModel: UserViewModel) {
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
        setupView()
    }
    
    // MARK: - Private methods
    private func setupView() {
        self.profileImage.layer.cornerRadius = generalCornerRadius
        self.nameLabel.layer.cornerRadius = generalCornerRadius
        self.signatureImage.layer.cornerRadius = generalCornerRadius
        self.profileImage.layer.cornerRadius = generalCornerRadius
        self.internalStackView.layer.cornerRadius = generalCornerRadius
        self.internalStackView.layer.borderWidth = generalCornerWidth
        self.horizontalInternalStackView.layer.borderWidth = generalCornerWidth
        
    }
    
    private func setupAddButton() {
        let dialogMessage = UIAlertController(title: "Confirm", message: "No se ha implementado", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
         })
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }

}
