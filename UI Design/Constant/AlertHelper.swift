//
//  AlertHelper.swift
//  UI Design
//
//  Created by Admin on 08/03/24.
//
import UIKit

class AlertHelper {
    
    static func showAlert(message: String, viewController: UIViewController) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true)
    }
}
