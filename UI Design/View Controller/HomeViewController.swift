//  HomeViewController.swift
//  UI Design
//  Created by Admin on 11/03/24.

import UIKit
import SideMenu

class HomeViewController: UIViewController{

    

   var category = ["SHOP BY CATEGORY", "OFFERS" , "JEANS", "BOOKING CATEGORY", "DEALS ON SHIRTS"]
    var carouselData: [String] = [
            "slider1",
            "slider2",
            "slider3",
        ]
  
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBAction func menuBtn(_ sender: UIButton) {
        let sideMenuVc = self.storyboard?.instantiateViewController(withIdentifier: "SideMenuNavigationController") as! SideMenuNavigationController
        sideMenuVc.statusBarEndAlpha = 0
        sideMenuVc.presentationStyle.presentingEndAlpha = 0.6
        sideMenuVc.presentationStyle.backgroundColor = .black
        sideMenuVc.menuWidth = (UIScreen.main.bounds.width / 5) * 3.4
        present(sideMenuVc, animated: true)
    }
    
    struct collectionCategory {
        let productName : String
        let productImage : String
    }
    let data : [collectionCategory] = [
        collectionCategory(productName: "Fashion", productImage: "fashion"),
        collectionCategory(productName: "Mobile", productImage: "mobile"),
        collectionCategory(productName: "Electronics", productImage: "electronics"),
        collectionCategory(productName: "Furniture", productImage: "furniture"),
        collectionCategory(productName: "Gadgets", productImage: "gadgets"),
        collectionCategory(productName: "Grocery", productImage: "grocery"),
        collectionCategory(productName: "Kids", productImage: "kids"),
    ]
    struct product_details {
        let prodName : String
        let prodImage : String
        let prodDetails : String
    }
    
    let course_data : [product_details] = [
        product_details(prodName: "Trouser 1", prodImage: "product1", prodDetails: "Rs 600.00"),
        product_details(prodName: "Trouser 2", prodImage: "product2", prodDetails: "Rs 400.00"),
        product_details(prodName: "Trouser 3", prodImage: "product3", prodDetails: "Rs 800.00"),
        product_details(prodName: "Trouser 4", prodImage: "product4", prodDetails: "Rs 200.00")
        
    ]
    let services : [product_details] = [
        product_details(prodName: "Painting and HomeMaking", prodImage: "painting", prodDetails: "sdfsfneiuh  hegeuig h9aerh fushrugh"),
        product_details(prodName: "Tutoring", prodImage: "tutoring", prodDetails: " r gjrgier hgaun trhgdio hevhgiu "),
        product_details(prodName: "Plumbering", prodImage: "plumber", prodDetails: "Rs  ruhdfu niugifhv ipugfhpg8ruhu gregiu"),
        product_details(prodName: "CarPaintering", prodImage: "carpainter", prodDetails: "Rs ui ehfu9dbfduig yuhdig hgioh fiuh u g")
        
    ]
    let Shirt : [product_details] = [
        product_details(prodName: "Shirt1", prodImage: "shirt1", prodDetails: "Rs 400.00"),
        product_details(prodName: "Shirt2", prodImage: "shirt2", prodDetails: "Rs 300.00"),
        product_details(prodName: "Shirt3", prodImage: "shirt3", prodDetails: "Rs 200.00"),
        product_details(prodName: "Shirt4", prodImage: "shirt4", prodDetails: "Rs 600.00")
        
    ]

    @IBOutlet weak var productTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        productTableView.dataSource = self
        productTableView.delegate = self
        
        configureSearchTextField()
    }
    func configureSearchTextField() {
        // Customize the appearance of the UITextField
        searchTextField.placeholder = "Search by product and booking"
        searchTextField.borderStyle = .roundedRect
        searchTextField.backgroundColor = .white
        searchTextField.clearButtonMode = .whileEditing
        
        // Add a magnifying glass icon to the left side of the UITextField
        let magnifyingGlassImageView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        magnifyingGlassImageView.contentMode = .scaleAspectFit
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 20)) // Adjust width and height as needed
        magnifyingGlassImageView.frame.origin.x = 10 // Adjust the padding here
        leftView.addSubview(magnifyingGlassImageView)
        searchTextField.leftView = leftView
        searchTextField.leftViewMode = .always
    }

    

    
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for:  indexPath) as! TableViewCell
           cell.categoryLbl.text = category[indexPath.row]
        cell.getIndexValue(indexValue: indexPath.row)
           return cell
       }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0{
            return 180
        }
        else if indexPath.row == 1{
            return 250
        }
        else if indexPath.row == 2{
            return 350
        }
        else if indexPath.row == 3{
            return 300
        }
        else if indexPath.row == 4{
            return 350
        }
        else{
            return 0
        }
    }
}
