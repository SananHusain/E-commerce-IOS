//
//  SideMenuViewController.swift
//  UI Design
//
//  Created by Admin on 14/03/24.
//

import UIKit

class SideMenuViewController: UIViewController{

    @IBOutlet weak var sideMenuTableView: UITableView!
    
    // Array of menu items
    let menuItems: [[String: String]] = [
        ["icon": "house", "label": "Home"],
        ["icon": "dollarsign.circle", "label": "My Earning"],
        ["icon": "xmark.circle", "label": "Rejected Orders"],
        ["icon": "square.and.arrow.up", "label": "Requested Services"],
        ["icon": "tag", "label": "Deals"],
        ["icon": "clock.arrow.circlepath", "label": "Payment History"],
        ["icon": "arrow.uturn.backward.circle", "label": "Logout"]
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        sideMenuTableView.dataSource = self
               sideMenuTableView.delegate = self
    }
    

}
extension SideMenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        let menuItem = menuItems[indexPath.row]
        cell.menuIcon.image = UIImage(systemName: menuItem["icon"] ?? "")
        cell.menuName.text = menuItem["label"]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle selection of menu item
        let selectedItem = menuItems[indexPath.row]["label"] ?? ""
        print("Selected menu item: \(selectedItem)")
        
        // Perform actions based on selected menu item, such as navigating to a different view controller
    }
}
