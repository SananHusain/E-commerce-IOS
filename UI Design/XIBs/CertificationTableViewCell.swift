//
//  CertificationTableViewCell.swift
//  UI Design
//
//  Created by Admin on 07/03/24.
//

import UIKit

class CertificationTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var masterBtn: UIButton!
    @IBOutlet weak var BachelorBtn: UIButton!
    @IBOutlet weak var diplomaBtn: UIButton!
    @IBOutlet weak var intermediateBtn: UIButton!
    @IBOutlet weak var categoryLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Set initial images for buttons
        masterBtn.setImage(UIImage(systemName: "square"), for: .normal)
        BachelorBtn.setImage(UIImage(systemName: "square"), for: .normal)
        diplomaBtn.setImage(UIImage(systemName: "square"), for: .normal)
        intermediateBtn.setImage(UIImage(systemName: "square"), for: .normal)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    func updateButtonState(_ button: UIButton, selected: Bool) {
          let imageName = selected ? "checkmark.square.fill" : "square"
          button.setImage(UIImage(systemName: imageName), for: .normal)
      }
}
