//
//  ViewController.swift
//  JSON
//
//  Created by Jacob Paul Hassler on 11/30/18.
//  Copyright © 2018 jphyr4. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    final let url = URL(string: "https://content.techinnovator.info/courses/INFOTC4425/challenges/Codable%20and%20JSON%20Decoding/inventory.json")
    
   private var products = [Product]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func downloadJson() {
        guard let downloadURL = url else {return}
        URLSession.shared.dataTask(with: downloadURL) { data, URLResponse, error in
            guard let data = data, error == nil, URLResponse != nil else {
            print("something is wrong")
                return
                }
            
            print("downloaded")
            do
            {
              let decoder = JSONDecoder()
                let downloadedProducts = try decoder.decode(Products.self, from:data)
                self.products = downloadedProducts.products
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch {
                print("Something wrong")
            }
        }.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as? ProductCell else {return UITableViewCell()}
        
        cell.nameLbl.text = products[indexPath.row].title
        cell.stockLbl.text = products[indexPath.row].stockedQuantity
        
        return cell
        
        
    }
}

