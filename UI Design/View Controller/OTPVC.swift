//
//  OTPVC.swift
//  UI Design
//
//  Created by Admin on 05/03/24.
//

import UIKit

class OTPVC: UIViewController {
    
    
    @IBOutlet weak var txtField1: UITextField!
    @IBOutlet weak var txtField2: UITextField!
    @IBOutlet weak var txtField3: UITextField!
    @IBOutlet weak var txtField4: UITextField!
    @IBOutlet weak var backBtn: UIButton!
    
    var textFields: [UITextField]!
    
    @IBAction func verifyBtnHit(_ sender: UIButton) {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
            self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
    }
    
    

        override func viewDidLoad() {
            super.viewDidLoad()

            // Set up the text fields
            textFields = [txtField1, txtField2, txtField3, txtField4]

            // Apply styling to the OTP text fields
            styleOTPTextFields()
            
            backBtn.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        }

    @objc func goBack() {
          navigationController?.popViewController(animated: true)
        }
    
        func styleOTPTextFields() {
            for textField in textFields {
                      // Apply styling and restrictions
                      textField.backgroundColor = UIColor.systemGray6
                      textField.textColor = UIColor.black
                      textField.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
                      textField.layer.shadowColor = UIColor.black.cgColor
                      textField.layer.shadowOffset = CGSize(width: 0, height: 2)
                      textField.layer.shadowOpacity = 0.2
                      textField.layer.shadowRadius = 3
                      textField.layer.masksToBounds = false
                      textField.borderStyle = .none
                      textField.layer.cornerRadius = 12
                      textField.layer.borderWidth = 2
                      textField.layer.borderColor = UIColor.clear.cgColor
                      textField.textAlignment = .center
                      textField.delegate = self
            }
        }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
            let maxLength = 1

            guard let text = textField.text, text.count >= maxLength else {
                return
            }

            // Move to the next text field or resign the keyboard if the last one is reached
            if let index = textFields.firstIndex(of: textField), index < textFields.count - 1 {
                textFields[index + 1].becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
            }
        }
    }
extension OTPVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Limit input to numeric characters and restrict length to 1 character
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)

        return allowedCharacters.isSuperset(of: characterSet) && textField.text?.count ?? 0 < 1
    }
}
