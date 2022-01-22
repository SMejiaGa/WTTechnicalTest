//
//  ContactViewController.swift
//  WTTechnicalTest
//
//  Created by Sebastian Mejia on 20/01/22.
//

import UIKit

class ContactViewController: UIViewController {
    @IBAction private func backButton() {
        self.navigationController?.popViewController(animated: true)
    }
    private let viewModel: ContactViewModel
    
    init(viewModel: ContactViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true  

        // Do any additional setup after loading the view.
    }
}
