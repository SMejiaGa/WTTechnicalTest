//
//  ContactViewController.swift
//  WTTechnicalTest
//
//  Created by Sebastian Mejia on 20/01/22.
//

import UIKit
import GoogleMaps

class ContactViewController: UIViewController {
    
    // MARK: - IBoutlets
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var contactTextView: RoundTextField!
    
    // MARK: - IBActions
    @IBAction private func backButton() {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func sendRequest() {
        checkTextField()
    }
    
    // MARK: - Properties
    private let viewModel: ContactViewModel
    
    // MARK: - Dependencies
    init(viewModel: ContactViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: Self.self), bundle: nil)
        setupMap()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    // MARK: - Private Functions
    private func setupMap() {
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect(x: 0, y: 500, width: 500, height: 400), camera: camera)
        self.view.addSubview(mapView)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        mapView.settings.myLocationButton = true
    }
    
    private func setupContactButton() {
        let dialogMessage = UIAlertController(title: "Contacto", message: Lang.Contact.contactReceived, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
         })
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    private func checkTextField() {
        if TextFieldConfirmations.isLenghtValid(
            contactTextView,
            validNumber: 6
        ) {
            setupContactButton()
        } else {
            self.statusLabel.text = Lang.Contact.textFieldError
        }
    }
    
}
