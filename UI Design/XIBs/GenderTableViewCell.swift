//
//  GenderTableViewCell.swift
//  UI Design
//
//  Created by Admin on 07/03/24.
//

import UIKit

class GenderTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var femaleBtn: UIButton!
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var txtLebel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Configure the initial state of radio buttons
               maleBtn.isSelected = false
               femaleBtn.isSelected = false
               
               // Set images for different states
               maleBtn.setImage(UIImage(named: "radio-button"), for: .normal)
               maleBtn.setImage(UIImage(named: "radio"), for: .selected)
               
               femaleBtn.setImage(UIImage(named: "radio-button"), for: .normal)
               femaleBtn.setImage(UIImage(named: "radio"), for: .selected)
               
               // Add targets for button actions
               maleBtn.addTarget(self, action: #selector(maleButtonTapped), for: .touchUpInside)
               femaleBtn.addTarget(self, action: #selector(femaleButtonTapped), for: .touchUpInside)
           }
    
    @objc func maleButtonTapped() {
           maleBtn.isSelected = true
           femaleBtn.isSelected = false
           // Update your data model or perform any other actions as needed
       }

       @objc func femaleButtonTapped() {
           maleBtn.isSelected = false
           femaleBtn.isSelected = true
           // Update your data model or perform any other actions as needed
       }
    func configure(selectedGender: String) {
           // Update the UI based on the selected gender
           maleBtn.isSelected = selectedGender == "Male"
           femaleBtn.isSelected = selectedGender == "Female"
       }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
