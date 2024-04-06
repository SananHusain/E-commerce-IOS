//
//  SignUpViewController.swift
//  UI Design
//
//  Created by Admin on 05/03/24.
//

import UIKit

class SignUpViewController: UIViewController , UITextViewDelegate
{
    
    var headerArr = ["First Name", "Last Name", "Email", "Phone Number", "Gender" , "Password", "Confirm Password", "Certification", "Bio"]
    var pHolder = ["First Name", "Last Name", "Email", "Phone Number", "Gender" , "Password", "Confirm Password", "Certification" , "Bio"]

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var signUpSubmitBtn: UIButton!
    
   
    @IBOutlet weak var policyBtn: UIButton!
    
    var modelClass = Constant()
    var isPasswordSecure = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
     

        tableView.register(UINib(nibName: "SignUpTableViewCell" , bundle: nil), forCellReuseIdentifier: "SignUpTableViewCell")
        tableView.register(UINib(nibName: "GenderTableViewCell", bundle: nil), forCellReuseIdentifier: "GenderTableViewCell")
        tableView.register(UINib(nibName: "CertificationTableViewCell", bundle: nil), forCellReuseIdentifier: "CertificationTableViewCell")
        tableView.register(UINib(nibName: "BioTableViewCell" , bundle: nil), forCellReuseIdentifier: "BioTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer: )))
        imgProfile.addGestureRecognizer(tapGesture)
        signUpSubmitBtn.layer.cornerRadius = 10
        signUpSubmitBtn.layer.masksToBounds = true
        
        policyBtn.addTarget(self, action: #selector(policyButtonTapped), for: .touchUpInside)
    }
    
    
    
    @objc func imageTapped(tapGestureRecognizer : UITapGestureRecognizer){
        openGallery()
    }
    //-------------------------------------------------------------//
    @IBAction func backBtnHit(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.tag == 8 {
            // Update the bio property in your model class with the text from the UITextView
                      modelClass.bio = textView.text
                      print(modelClass.bio)
        }
    }
  
   
    //--------------------------------policybtn-----------------------------//
    @objc func policyButtonTapped() {
        policyBtn.isSelected.toggle()
        updatePolicyButtonState()
        // You can store the state in UserDefaults or perform any other action based on the button state.
    }
    
    @IBAction func signUpSubmitHit(_ sender: UIButton) {
        //validate null fields
        if modelClass.firstName.isEmpty {
            showAlert(message: "Enter your first name")
        }
        else if modelClass.lastName.isEmpty{
            showAlert(message: "Enter your last name")
        }
//        else if modelClass.email.isEmpty {
//            showAlert(message: "Enter your Email")
//        }
//        else if !RegexHelper.isValidEmail(modelClass.email) {
//               // Show an error message for invalid email
//               showAlert(message: "Enter a valid email")
//        }
//        else if modelClass.phoneNumber.isEmpty {
//            showAlert(message: "Enter your Phone number")
//        }
//        else if !RegexHelper.isValidPhoneNumber(modelClass.phoneNumber) {
//             showAlert(message: "Enter a valid phone number")
//        }
//        else if modelClass.gender.isEmpty{
//               showAlert(message: "Select your gender")
//        }
//        else if !RegexHelper.isValidPassword(modelClass.password) {
//            showAlert(message: "Enter a strong password. Containing 1 UC letter, Min 8 Char, 1 special symbol")
//           }
//        else if modelClass.confirmPassword.isEmpty{
//            showAlert(message: "Enter Confirm password")
//        }
//        else if modelClass.password != modelClass.confirmPassword {
//            showAlert(message: "Password not matched")
//        }
//        else if modelClass.certifications.isEmpty {
//            showAlert(message: "fill your certification")
//        }
//        else if modelClass.bio.isEmpty {
//            showAlert(message: "Fill your Bio")
//        }
        else if policyBtn.isSelected{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "OTPVC") as! OTPVC
            self.navigationController?.pushViewController(vc, animated: true)
            showAlert(message: "Enter the OTP sent to your mobile number")
        }
        else{
            // All validations passed, proceed with submission
           showAlert(message: "Accept privacy Policy to proceed")
        }
        
    }
    
func updatePolicyButtonState() {
    if policyBtn.isSelected {
        policyBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        policyBtn.tintColor = UIColor.systemRed // Customize the tint color for the checked state
    } else {
        policyBtn.setImage(UIImage(systemName: "square"), for: .normal)
        policyBtn.tintColor = UIColor.systemRed // Reset the tint color for the unchecked state
    }
}
}

extension SignUpViewController : UITableViewDelegate, UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
    
        
        //----------------------------------------Certification------------------------------------------//
        
        if indexPath.row == 7 {
            cell = tableView.dequeueReusableCell(withIdentifier: "CertificationTableViewCell", for: indexPath) as! CertificationTableViewCell
            
            if let certificateCell = cell as? CertificationTableViewCell {
                certificateCell.categoryLbl.text = headerArr[indexPath.row]
                certificateCell.masterBtn.addTarget(self, action: #selector(certificationButtonTapped(sender: )), for: .touchUpInside)
                certificateCell.BachelorBtn.addTarget(self, action: #selector(certificationButtonTapped(sender: )), for: .touchUpInside)
                certificateCell.diplomaBtn.addTarget(self, action: #selector(certificationButtonTapped(sender: )), for: .touchUpInside)
                certificateCell.intermediateBtn.addTarget(self, action: #selector(certificationButtonTapped(sender: )), for: .touchUpInside)

            }
        }
        
        
        //-----------------------------------------Gender-----------------------------------------//
        
        
        
      else if indexPath.row == 4 {
            cell = tableView.dequeueReusableCell(withIdentifier: "GenderTableViewCell", for: indexPath) as! GenderTableViewCell

            if let genderCell = cell as? GenderTableViewCell {
                genderCell.txtLebel.text = headerArr[indexPath.row]
                genderCell.maleBtn.addTarget(self, action: #selector(genderRadioButtonTapped(_:)), for: .touchUpInside)
                genderCell.femaleBtn.addTarget(self, action: #selector(genderRadioButtonTapped(_:)), for: .touchUpInside)
                genderCell.maleBtn.isSelected = modelClass.gender == "Male"
                genderCell.femaleBtn.isSelected = modelClass.gender == "Female"
            }
        }
       
        //----------------------------------------Bio------------------------------------------//
        
        else if indexPath.row == 8 {
            cell = tableView.dequeueReusableCell(withIdentifier: "BioTableViewCell", for: indexPath) as! BioTableViewCell

            if let bioCell = cell as? BioTableViewCell {
                bioCell.bioLbl.text = headerArr[indexPath.row]
                configureBioCell(bioCell, forRowAt: indexPath)
            }
        }
        
        //-------------------------------------Other text fields-------------------------------------//
        
        else {
            let signUpCell = tableView.dequeueReusableCell(withIdentifier: "SignUpTableViewCell", for: indexPath) as! SignUpTableViewCell
            configureSignUpCell(signUpCell, forRowAt: indexPath)
            cell = signUpCell
        }

        return cell
    }
    
    
    //----------------------------------------------------------------------------------//
    func configureBioCell(_ cell: BioTableViewCell, forRowAt indexPath: IndexPath) {
        cell.bioLbl.text = headerArr[indexPath.row]
        cell.txtView.text = modelClass.bio
        cell.txtView.delegate = self
        cell.txtView.tag = indexPath.row
    }

        func configureSignUpCell(_ cell: SignUpTableViewCell, forRowAt indexPath: IndexPath)
    {
                   cell.txtLabel.text = headerArr[indexPath.row]
                   cell.txtField.placeholder = "Enter \(pHolder[indexPath.row])"
                   cell.txtField.delegate = self
                   cell.txtField.tag = indexPath.row
                   cell.actionBtn.tag = indexPath.row

        switch indexPath.row {
            case 0 :
                    //first name
                cell.txtField.text = modelClass.firstName
                cell.txtField.keyboardType = .default
                cell.txtField.autocapitalizationType = .none
                cell.actionBtn.isHidden = true
                cell.txtField.autocorrectionType = UITextAutocorrectionType.no
                  
            case 1 :
                    //last name
                cell.txtField.text = modelClass.lastName
                cell.txtField.keyboardType = .default
                cell.txtField.autocapitalizationType = .none
                cell.actionBtn.isHidden = true
                cell.txtField.autocorrectionType = UITextAutocorrectionType.no
                  
            case 2 :
                    //email
                cell.txtField.text = modelClass.email
                cell.txtField.keyboardType = .emailAddress
                cell.txtField.autocapitalizationType = .none
                cell.actionBtn.isHidden = true
                cell.txtField.autocorrectionType = UITextAutocorrectionType.no
                  
            case 3 :
                    //phone number
                cell.txtField.text = modelClass.phoneNumber
                cell.txtField.keyboardType = .numberPad
                cell.txtField.autocapitalizationType = .none
                cell.actionBtn.isHidden = true
                cell.txtField.autocorrectionType = UITextAutocorrectionType.no
                  
            case 4:
                // gender
                cell.txtField.text = modelClass.gender
                cell.txtField.isEnabled = false // Disable editing for the gender field
                cell.actionBtn.isHidden = true // Hide any action button specific to the gender field
                  
            case 5 :
                //password
                cell.txtField.text = modelClass.password
                cell.txtField.keyboardType = .default
                cell.txtField.autocapitalizationType = .none
                cell.actionBtn.isHidden = false
                cell.actionBtn.addTarget(self, action: #selector(eyeBtnTapped(sender: )), for: .touchUpInside)
                cell.actionBtn.setImage(UIImage(systemName: "eye"), for: .normal)
                cell.txtField.autocorrectionType = UITextAutocorrectionType.no
                  
                  
                  
            case 6 :
                //confirm password
                cell.txtField.text = modelClass.confirmPassword
                cell.txtField.keyboardType = .default
                cell.txtField.autocapitalizationType = .none
                cell.actionBtn.isHidden = false
                cell.actionBtn.addTarget(self, action: #selector(eyeBtnTapped(sender: )), for: .touchUpInside)
                cell.actionBtn.setImage(UIImage(systemName: "eye"), for: .normal)
                cell.txtField.autocorrectionType = UITextAutocorrectionType.no
                       
            case 7 :
                cell.txtField.text = modelClass.certifications.joined(separator: ", ")
                
            default:
                break
                   }
               }
      
    
    @objc func genderRadioButtonTapped(_ sender: UIButton) {
           let indexPath = IndexPath(row: 4, section: 0)
           if let cell = tableView.cellForRow(at: indexPath) as? GenderTableViewCell {
               // Update the modelClass.gender based on the selected radio button
               modelClass.gender = sender == cell.maleBtn ? "Male" : "Female"

               // Update the state of the radio buttons
               cell.maleBtn.isSelected = modelClass.gender == "Male"
               cell.femaleBtn.isSelected = modelClass.gender == "Female"
           }
       }
    
    //-------------------------------------------------------------//
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headerArr.count
    }
    
    //-------------------------------------------------------------//
    @objc func eyeBtnTapped(sender: UIButton)
    {
        let tag = sender.tag
        if tag == 5 || tag == 6
        {
            isPasswordSecure.toggle()
            let indexPath = IndexPath(row: tag, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) as? SignUpTableViewCell
            {
                if isPasswordSecure
                {
                    // Code for secure password condition
                    cell.txtField.isSecureTextEntry = false
                    cell.actionBtn.setImage(UIImage(systemName: "eye"), for: .normal)
                } else
                {
                    // Code for insecure password condition
                    cell.txtField.isSecureTextEntry = true
                    cell.actionBtn.setImage(UIImage(systemName: "eye.slash"), for: .normal)
                }
            }
        }
    }
}
//-------------------------------------------------------------//

extension SignUpViewController : UITextFieldDelegate {
    //-------------------------------------------------------------//
    

    //-------------------------------------------------------------//
    func textFieldDidEndEditing(_ textField: UITextField) {
        let indexPath = IndexPath(row: textField.tag, section: 0)
        
        // Safely unwrap the optional cell
        if let cell = tableView.cellForRow(at: indexPath) as? SignUpTableViewCell {

                switch indexPath.row {
                case 0 :
                    modelClass.firstName = textField.text ?? ""
                case 1 :
                    modelClass.lastName = textField.text ?? ""
                case 2 :
                    modelClass.email = textField.text ?? ""
                case 3 :
                    modelClass.phoneNumber = textField.text ?? ""
                case 4 :
                    modelClass.gender = textField.text ?? ""
                case 5 :
                    modelClass.password = textField.text ?? ""
                case 6 :
                    modelClass.confirmPassword = textField.text ?? ""
                case 7:
                    modelClass.certifications = textField.text?.components(separatedBy: ",") ?? []
                default:
                    break
                }
            }
        }
    
    

    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
extension SignUpViewController : UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func openGallery() {
           let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

           let cameraAction = UIAlertAction(title: "Take Photo", style: .default) { [weak self] _ in
               self?.openCamera()
           }

           let galleryAction = UIAlertAction(title: "Choose from Gallery", style: .default) { [weak self] _ in
               self?.openPhotoLibrary()
           }

           let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

           actionSheet.addAction(cameraAction)
           actionSheet.addAction(galleryAction)
           actionSheet.addAction(cancelAction)

           present(actionSheet, animated: true, completion: nil)
       }

       func openCamera() {
           if UIImagePickerController.isSourceTypeAvailable(.camera) {
               let imagePicker = UIImagePickerController()
               imagePicker.delegate = self
               imagePicker.sourceType = .camera
               imagePicker.allowsEditing = true
               present(imagePicker, animated: true, completion: nil)
           } else {
               // Display an alert indicating that the camera is not available
               showAlert(message: "Camera not available on this device.")
           }
       }

       func openPhotoLibrary() {
           let imagePicker = UIImagePickerController()
           imagePicker.delegate = self
           imagePicker.sourceType = .photoLibrary
           imagePicker.allowsEditing = true
           present(imagePicker, animated: true)
       }


    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let img = info[.originalImage] as? UIImage{
            imgProfile.image = img
        }
        dismiss(animated: true)
     }
   
}



// Add the missing functionality for the Certification cell and Bio cell
extension SignUpViewController
{
    @objc func certificationButtonTapped(sender: UIButton) {
        let indexPath = IndexPath(row: 7, section: 0)
        if let cell = tableView.cellForRow(at: indexPath) as? CertificationTableViewCell {
            switch sender {
            case cell.masterBtn:
                toggleCertification("Master's", in: cell)
            case cell.BachelorBtn:
                toggleCertification("Bachelor's", in: cell)
            case cell.diplomaBtn:
                toggleCertification("Diploma", in: cell)
            case cell.intermediateBtn:
                toggleCertification("Intermediate", in: cell)
            default:
                break
            }
        }
    }
    
    func toggleCertification(_ certification: String, in cell: CertificationTableViewCell) {
        if let index = modelClass.certifications.firstIndex(of: certification) {
            // Certification is already selected, remove it
            modelClass.certifications.remove(at: index)
        } else {
            // Certification is not selected, add it
            modelClass.certifications.append(certification)
        }
        
        // Update the UI state
        cell.updateButtonState(cell.masterBtn, selected: modelClass.certifications.contains("Master's"))
        cell.updateButtonState(cell.BachelorBtn, selected: modelClass.certifications.contains("Bachelor's"))
        cell.updateButtonState(cell.diplomaBtn, selected: modelClass.certifications.contains("Diploma"))
        cell.updateButtonState(cell.intermediateBtn, selected: modelClass.certifications.contains("Intermediate"))
        
        // Update the modelClass with the selected certifications
        modelClass.certifications = modelClass.certifications
    }
}




