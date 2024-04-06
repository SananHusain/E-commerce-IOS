
import UIKit
import IQKeyboardManagerSwift

class ViewController: UIViewController{

    
    @IBOutlet weak var passwordToggleButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
   
    @IBAction func registerHit(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as!  SignUpViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func loginHit(_ sender: UIButton) {
        guard let email = emailTextField.text, RegexHelper.isValidEmail(email) else {
                   showAlert(message: "Please enter a valid email address.")
                   return
               }

               guard let password = passwordTextField.text, RegexHelper.isValidPassword(password) else {
                   showAlert(message: "Please enter a valid password. It must be at least 8 characters long.")
                   return
               }
        //redirect to the homapage
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.navigationController?.pushViewController(homeVC, animated: true
        )
        
    }
    
    
    @IBOutlet weak var rememberMe: UIButton!
 
    @IBAction func forgotPasswordHit(_ sender: UIButton) {
        
        let forgotVc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        self.navigationController?.pushViewController(forgotVc, animated: true)
    }
    
    
    
    override func viewDidLoad() {
          super.viewDidLoad()
          
          NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
          
          setUpLeftView(for: emailTextField, imageName: "envelope.fill")
          setUpLeftView(for: passwordTextField, imageName: "lock.fill")
          
          configurePasswordToggleButton()
          configureRememberMeButton()
      }
      
      @objc func keyboardWillHide() {
          view.endEditing(true)
      }
  
    func setUpLeftView(for textField: UITextField, imageName: String) {
        let iconImageView = UIImageView(image: UIImage(systemName: imageName))
        iconImageView.tintColor = .red
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: textField.frame.size.height))
        iconImageView.frame = CGRect(x: 10, y: 0, width: 20, height: textField.frame.size.height)
        iconImageView.contentMode = .center
        
        paddingView.addSubview(iconImageView)
        
        let lineView = UIView(frame: CGRect(x: 40, y: 8, width: 1, height: textField.frame.size.height - 16))
        lineView.backgroundColor = .gray
        paddingView.addSubview(lineView)
        
        textField.leftView = paddingView
        textField.leftViewMode = .always
    }
 
    func configurePasswordToggleButton() {
           let openEyeImage = UIImage(named: "hidden")?.withRenderingMode(.alwaysTemplate)
           let closedEyeImage = UIImage(named: "eye")?.withRenderingMode(.alwaysTemplate)
           
           passwordToggleButton.tintColor = .lightGray
           passwordToggleButton.isSelected = false
           passwordToggleButton.setImage(closedEyeImage, for: .normal)
           passwordToggleButton.setImage(openEyeImage, for: .selected)
           
           passwordToggleButton.addTarget(self, action: #selector(passwordToggleButtonTapped(_:)), for: .touchUpInside)
       }
    
    @objc func passwordToggleButtonTapped(_ sender: UIButton) {
          sender.isSelected.toggle()
          passwordTextField.isSecureTextEntry.toggle()
      }
    
    func configureRememberMeButton() {
           updateRememberMeButtonState()
           rememberMe.semanticContentAttribute = .forceRightToLeft
           rememberMe.addTarget(self, action: #selector(rememberMeButtonTapped), for: .touchUpInside)
       }
       
       @objc func rememberMeButtonTapped() {
           rememberMe.isSelected.toggle()
           updateRememberMeButtonState()
       }
       
       func updateRememberMeButtonState() {
           let image = rememberMe.isSelected ? UIImage(systemName: "checkmark.square") : UIImage(systemName: "square")
           rememberMe.setImage(image, for: .normal)
           rememberMe.tintColor = .systemRed
       }
       
       func showAlert(message: String) {
           let alertController = UIAlertController(title: "Validation Error", message: message, preferredStyle: .alert)
           let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
           alertController.addAction(okAction)
           present(alertController, animated: true, completion: nil)
       }
   }
