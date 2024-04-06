//
//  ProductVC.swift
//  UI Design
//
//  Created by Admin on 15/03/24.
//

import UIKit

class ProductVC: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailPrice: UILabel!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailDescription: UILabel!
    @IBAction func addToCartBtn(_ sender: UIButton) {
        //coding for add to cart button
    }
    
    var productName: String = ""
    var productPrice: String = ""
    var productImage: UIImage?
    var productDescription: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Configure UI elements
              configureUI()
    }
    func configureUI() {
            // Set background color
            view.backgroundColor = .white
            
            // Configure detailImage
            detailImage.layer.cornerRadius = 30 // Apply rounded corners to the image
            detailImage.clipsToBounds = true // Ensure the image stays within its bounds
            
            // Make bottom corners rounded
            let maskPath = UIBezierPath(roundedRect: detailImage.bounds,
                                        byRoundingCorners: [.bottomLeft, .bottomRight],
                                        cornerRadii: CGSize(width: 30, height: 30))
            let maskLayer = CAShapeLayer()
            maskLayer.path = maskPath.cgPath
            detailImage.layer.mask = maskLayer
            
            // Configure detailPrice
            detailPrice.textColor = .systemGreen // Set text color to green for price
        
        // Set product details to UI elements
              detailName.text = productName
              detailPrice.text = productPrice
              detailImage.image = productImage
              detailDescription.text = productDescription
            
        }
    
}
