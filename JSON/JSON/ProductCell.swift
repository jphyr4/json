//
//  Product.swift
//  JSON
//
//  Created by Jacob Paul Hassler on 11/30/18.
//  Copyright © 2018 jphyr4. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var stockLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
