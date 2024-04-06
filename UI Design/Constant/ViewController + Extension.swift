//
//  ViewController + Extension.swift
//  UI Design
//
//  Created by Admin on 15/03/24.
//

import Foundation
import UIKit

extension UIViewController{
    
    static var identifier : String{
        return String(describing: self)
    }
    
    static func instantiate() -> Self{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController( identifier: identifier) as! Self
    }
}
