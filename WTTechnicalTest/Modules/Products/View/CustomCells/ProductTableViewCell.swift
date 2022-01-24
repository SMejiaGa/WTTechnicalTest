//
//  ProductTableViewCell.swift
//  WideTechIOSTest
//
//  Created by Sebastian Mejia on 20/01/22.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellView.layer.cornerRadius = 8
    }

    func configCell(name: String, description: String, image: UIImage) {
        self.productNameLabel.text = name
        self.descriptionLabel.text = description
        self.productImageView.image = image
    }

}
