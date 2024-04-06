//
//  HomeVC.swift
//  UI Design
//
//  Created by Admin on 09/03/24.
//

import UIKit
import SDWebImage

class HomeVC: UIViewController , UITableViewDataSource , UITableViewDelegate{

    
    struct Product: Codable {
        let id: Int
        let title: String
        let price: Double  // Change the data type to Double or Int, depending on your JSON
        let category: String
        let description: String
        let image: String
    }

    var products: [Product] = []
    
    @IBOutlet weak var productTableView: UITableView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchProducts()
    }
    
    func fetchProducts() {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                // Decode the JSON response into an array of Product objects
                let decodedProducts = try JSONDecoder().decode([Product].self, from: data)

                // Update the products array with the decoded data
                self.products = decodedProducts

                // Now you have an array of products, you can use them as needed
                print("Fetched products:", self.products)

                // Example: Update the UI on the main thread
                DispatchQueue.main.async {
                    // Reload the table view to display the fetched products
                    self.productTableView.reloadData()
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }

        task.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath) as! ProductTableViewCell
        
        let product =  products[indexPath.row]
        cell.prodName.text = product.title
        cell.prodPrice.text = "\(product.price)"
         cell.prodDetails.text = product.description
         cell.prodCategory.text = product.category
//         cell.prodImage.image = UIImage(named: product.image)
        if let imageUrl = URL(string: product.image) {
             cell.prodImage.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "placeholder"))
         } else {
             // Handle the case where the image URL is invalid
             cell.prodImage.image = UIImage(named: "placeholder")
         }

         return cell
    }
    
}
