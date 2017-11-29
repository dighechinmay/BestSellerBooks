//
//  BookDetailsViewController.swift
//  BestSellerBooks
//
//  Created by Chinmay Dighe on 11/29/17.
//  Copyright © 2017 chinmaydighe. All rights reserved.
//

import UIKit
import SDWebImage

class BookDetailsViewController: UIViewController {
    
    
    var imageURL: String!
    var book_description: String!
    var book_title: String!
    var book_author: String!
    var amazon: String!
    var review: String!
    
    
    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookDesLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var reviewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        bookCover.sd_setImage(with: URL(string: self.imageURL), completed: nil)
        bookTitleLabel.text = self.book_title
        bookDesLabel.text = self.book_description
        authorLabel.text = "by - \(self.book_author!)"
        
        if(self.review! == ""){
            
            self.reviewButton.isHidden = true
        }
       
        
        if(self.amazon! == ""){
            
             self.buyButton.isHidden = true
        }
       
        
        
    }

    
    
    @IBAction func buy(_ sender: Any) {
        
       UIApplication.shared.openURL(URL(string: self.amazon!)!)
       
    }
    
    
    
    
    @IBAction func review(_ sender: Any) {
        
        UIApplication.shared.openURL(URL(string: self.review!)!)
        
    }
    
    
    

  

}
