//
//  TableViewCell.swift
//  UI Design
//
//  Created by Admin on 11/03/24.
//

    import UIKit

    class TableViewCell: UITableViewCell{
       

        @IBOutlet weak var categoryLbl: UILabel!
        @IBOutlet weak var collectionView: UICollectionView!
        
        struct collectionCategory {
            let productName : String
            let productImage : String
        }
        
        let data : [collectionCategory] = [
            collectionCategory(productName: "Mobile", productImage: "mobile"),
            collectionCategory(productName: "Electronics", productImage: "electronics"),
            collectionCategory(productName: "Furniture", productImage: "furniture"),
            collectionCategory(productName: "Gadgets", productImage: "gadgets"),
            collectionCategory(productName: "Grocery", productImage: "grocery"),
            collectionCategory(productName: "Kids", productImage: "kids"),
            
        ]
        var carouselData: [String] = [
            "carousel2",
            "carousel3",
            "carousel4",
            ]
        struct product_details {
            let prodName : String
            let prodImage : String
            let prodDetails : String
        }
        
        let course_data : [product_details] = [
            product_details(prodName: "Trouser", prodImage: "product1", prodDetails: "Rs 400.00"),
            product_details(prodName: "Trouser", prodImage: "product2", prodDetails: "Rs 400.00"),
            product_details(prodName: "Trouser", prodImage: "product3", prodDetails: "Rs 400.00"),
            product_details(prodName: "Trouser", prodImage: "Product4", prodDetails: "Rs 400.00")
            ]
        let services : [product_details] = [
            product_details(prodName: "Painting and HomeMaking", prodImage: "painting", prodDetails: "sdfsfneiuh  hegeuig h9aerh fushrugh"),
            product_details(prodName: "Tutoring", prodImage: "tutoring", prodDetails: " r gjrgier hgaun trhgdio hevhgiu "),
            product_details(prodName: "Plumbering", prodImage: "plumber", prodDetails: "Rs  ruhdfu niugifhv ipugfhpg8ruhu gregiu"),
            product_details(prodName: "CarPaintering", prodImage: "carpainter", prodDetails: "Rs ui ehfu9dbfduig yuhdig hgioh fiuh u g")
            
        ]
        let Shirt : [product_details] = [
            product_details(prodName: "Shirt 1", prodImage: "shirt1", prodDetails: "Rs 400.00"),
            product_details(prodName: "Shirt 2", prodImage: "shirt2", prodDetails: "Rs 300.00"),
            product_details(prodName: "Shirt 3", prodImage: "shirt3", prodDetails: "Rs 200.00"),
            product_details(prodName: "Shirt 4", prodImage: "shirt4", prodDetails: "Rs 600.00")
        ]
        
        var category: [String] = []
        var timer: Timer?

       
        var indexVal = -1
        
        override func awakeFromNib() {
            super.awakeFromNib()
            collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
            collectionView.register(UINib(nibName: "CarouselCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CarouselCollectionViewCell")
            collectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
            
           collectionView.dataSource = self
            collectionView.delegate = self
            startTimer()
        }
        
        func getIndexValue(indexValue:Int){
            print("indexValue==\(indexValue)")
            indexVal = indexValue
            collectionView.reloadData()
        }
        func startTimer() {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(scrollAutomatically), userInfo: nil, repeats: true)
        }

        @objc func scrollAutomatically() {
            guard indexVal == 1, let collectionView = collectionView else { return }
            // Calculate the new index to scroll to
            let currentIndex = (collectionView.indexPathsForVisibleItems.last?.item ?? 0)
            let newIndex = (currentIndex + 1) % carouselData.count
            // Scroll to the new index
            collectionView.scrollToItem(at: IndexPath(item: newIndex, section: 0), at: .centeredHorizontally, animated: true)
        }

        override func prepareForReuse() {
            super.prepareForReuse()
            timer?.invalidate()
            timer = nil
        }

    }

extension TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch indexVal {
        case 0:
            return 6
        case 1:
            return 3
        case 2, 3, 4:
            return 4
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell
        
        switch indexVal {
        case 0:
            let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
            let product = data[indexPath.item]
            productCell.productName.text = product.productName
            productCell.productImage.image = UIImage(named: product.productImage)
            cell = productCell
        case 1:
            let carouselCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCollectionViewCell", for: indexPath) as! CarouselCollectionViewCell
            let imageName = carouselData[indexPath.item]
            carouselCell.carouselImage.image = UIImage(named: imageName)
            cell = carouselCell
        case 2:
                   let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
                   let product = course_data[indexPath.item]
                   categoryCell.prodImage.image = UIImage(named: product.prodImage)
                   categoryCell.prodName.text = product.prodName
                   categoryCell.prodDetails.text = product.prodDetails
                   cell = categoryCell
            
        case 3:
                   let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
                   let product = services[indexPath.item]
                   categoryCell.prodImage.image = UIImage(named: product.prodImage)
                   categoryCell.prodName.text = product.prodName
                   categoryCell.prodDetails.text = product.prodDetails
                   cell = categoryCell
        case 4:
                   let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
                   let product = Shirt[indexPath.item]
                   categoryCell.prodImage.image = UIImage(named: product.prodImage)
                   categoryCell.prodName.text = product.prodName
                   categoryCell.prodDetails.text = product.prodDetails
                   cell = categoryCell
        default:
            cell = UICollectionViewCell()
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width: CGFloat
        var height: CGFloat
        
        switch indexVal {
        case 0:
            let numberOfColumns: CGFloat = 4
            let spacing: CGFloat = 0
            width = (collectionView.bounds.width - (numberOfColumns - 1) * spacing) / numberOfColumns
            height = 110
        case 1:
            width = collectionView.bounds.width - 10
            height = 210
        case 2:
            let numberOfColumns: CGFloat = 2
            let spacing: CGFloat = 5
            width = (collectionView.bounds.width - (numberOfColumns - 1) * spacing) / numberOfColumns
            height = 300
        case 3:
            let numberOfColumns: CGFloat = 2
            let spacing: CGFloat = 5
            width = (collectionView.bounds.width - (numberOfColumns - 1) * spacing) / numberOfColumns
            height = 250
        case 4:
            let numberOfColumns: CGFloat = 2
            let spacing: CGFloat = 5
            width = (collectionView.bounds.width - (numberOfColumns - 1) * spacing) / numberOfColumns
            height = 300
        default:
            width = 300
            height = 300
        }

        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           // Get the selected product details based on the indexVal
           var selectedProduct: product_details?
           switch indexVal {
           case 2:
               selectedProduct = course_data[indexPath.item]
           case 3:
               selectedProduct = services[indexPath.item]
           case 4:
               selectedProduct = Shirt[indexPath.item]
           default:
               return
           }
           
           // Instantiate the ProductVC
           guard let productVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductVC") as? ProductVC,
                 let product = selectedProduct else {
               return
           }
           
           // Pass the selected product details to ProductVC
           productVC.productName = product.prodName
           productVC.productPrice = product.prodDetails
           productVC.productImage = UIImage(named: product.prodImage)
           productVC.productDescription = product.prodDetails
        print(product.prodName)
           
       }
}
