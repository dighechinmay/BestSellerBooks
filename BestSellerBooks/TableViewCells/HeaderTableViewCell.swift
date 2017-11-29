//
//  HeaderTableViewCell.swift
//  BestSellerBooks
//
//  Created by Chinmay Dighe on 11/28/17.
//  Copyright © 2017 chinmaydighe. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    
    @IBOutlet weak var headerLabel: UILabel!
    
    
    func configureHeaderCell(headerName: String){
        
        
                self.headerLabel.text = headerName
        
        
    }

    
}
