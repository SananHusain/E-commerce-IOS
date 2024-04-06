//
//  ForgotPasswordVC.swift
//  UI Design
//
//  Created by Admin on 04/03/24.
//

import UIKit

class ForgotPasswordVC: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLeftView(for: emailTextField, imageName: "envelope.fill")
        
        backBtn.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    
    @IBAction func submitHit(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OTPVC") as! OTPVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    @objc func goBack() {
          navigationController?.popViewController(animated: true)
        }
    
    func setUpLeftView(for textField: UITextField, imageName: String) {
        // Set up the icon
        let iconImageView = UIImageView(image: UIImage(systemName: imageName))
        iconImageView.tintColor = .red  // Customize the icon color if needed
        
        // Create a container view with padding
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: textField.frame.size.height))
        
        // Center the icon within the padding
        iconImageView.frame = CGRect(x: 10, y: 0, width: 20, height: textField.frame.size.height)
        iconImageView.contentMode = .center
        
        // Add the icon to the padding view
        paddingView.addSubview(iconImageView)
        
        // Add a line to the left of the icon
        let lineView = UIView(frame: CGRect(x: 40, y: 8, width: 1, height: textField.frame.size.height - 16))
        lineView.backgroundColor = .gray
        
        // Add the line to the padding view
        paddingView.addSubview(lineView)
        
        // Set the container view as the left view of the text field
        textField.leftView = paddingView
        textField.leftViewMode = .always  // Show the left view always
    }
    
}
