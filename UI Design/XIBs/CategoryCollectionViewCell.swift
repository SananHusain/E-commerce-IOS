//
//  CategoryCollectionViewCell.swift
//  UI Design
//
//  Created by Admin on 13/03/24.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var prodName: UILabel!
    
    @IBOutlet weak var prodDetails: UILabel!
    @IBOutlet weak var prodImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
