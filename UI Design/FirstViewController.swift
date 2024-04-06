//
//  FirstViewController.swift
//  UI Design
//
//  Created by Admin on 04/03/24.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.layer.cornerRadius = 15
    }
    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        
    }
    
}
