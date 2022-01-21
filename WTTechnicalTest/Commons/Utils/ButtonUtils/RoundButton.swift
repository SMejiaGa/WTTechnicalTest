//
//  RoundButton.swift
//  WTTechnicalTest
//
//  Created by Sebastian Mejia on 20/01/22.
//
import Foundation
import UIKit

class RoundButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 6
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.borderColor = UIColor.white.cgColor
    }
}
