//
//  BookTableViewCell.swift
//  BestSellerBooks
//
//  Created by Chinmay Dighe on 11/28/17.
//  Copyright © 2017 chinmaydighe. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var bookCoverImage: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookAuthorLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    
    
    
    func configureBookCell(author: String,title: String,rank: Int){
        
        
                    bookTitleLabel.text = title
                    bookAuthorLabel.text = author
                    rankLabel.text = "\(rank)"
    }
    

}
