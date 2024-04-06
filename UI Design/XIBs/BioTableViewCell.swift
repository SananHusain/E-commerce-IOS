//
//  BioTableViewCell.swift
//  UI Design
//
//  Created by Admin on 07/03/24.
//

import UIKit

class BioTableViewCell: UITableViewCell , UITextViewDelegate{

    @IBOutlet weak var txtView: UITextView!
    
    @IBOutlet weak var bioLbl: UILabel!
    
    var modelClass = Constant()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        txtView.delegate = self
        
        // Initialization code
        txtView.layer.borderWidth = 1.0 // You can adjust the width as needed
        txtView.layer.borderColor = UIColor.black.cgColor // You can set the color as needed
        txtView.layer.cornerRadius = 5.0 // You can adjust the radius for rounded corners if desired
    }
    func textViewDidChange(_ textView: UITextView) {
          // Assuming "bio" is the property in your model class
          // Update the modelClass.bio when the text changes
          modelClass.bio = textView.text
          print(modelClass.bio)
      }

    
}
