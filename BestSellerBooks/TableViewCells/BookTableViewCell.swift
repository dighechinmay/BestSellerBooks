//
//  BookTableViewCell.swift
//  BestSellerBooks
//
//  Created by Chinmay Dighe on 11/28/17.
//  Copyright © 2017 chinmaydighe. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    
    @IBOutlet weak var rankOrWol: UILabel!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookAuthorLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    
    
    
    func configureBookCell(author: String,title: String,rank: Int,flag: Bool,wol: Int){
        
        if(flag){
                    bookTitleLabel.text = title
                    bookAuthorLabel.text = author
                    rankLabel.text = "\(rank)"
                    rankOrWol.text = "Rank"
        }
        else {
            
                    bookTitleLabel.text = title
                    bookAuthorLabel.text = author
                    rankLabel.text = "\(wol)"
                    rankOrWol.text = "WOL"
            
        }
    }
    

}
