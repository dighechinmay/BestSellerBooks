//
//  LoadViewController.swift
//  BestSellerBooks
//
//  Created by Chinmay Dighe on 11/29/17.
//  Copyright © 2017 chinmaydighe. All rights reserved.
//

import UIKit
import Alamofire

class LoadViewController: UIViewController {
    
    
    var book_title: String!
    var book_author: String!
    var book_description: String!
    var book_isbn: String!
    var amazon: String!
    var review: String!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = newBackButton
        
        downloadBookCover()

       
    }

   
    
    
    func downloadBookCover(){
        
        
        
        let URL = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(self.book_isbn!)"
        
        
        
        Alamofire.request(URL).responseJSON{ response in
            
            
            let coverDetails = BookCoverModel(coverDetails: response.value as! Dictionary<String, AnyObject>)
            
            if let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "book") as? BookDetailsViewController{
                
                        destinationVC.imageURL = coverDetails.imageURL
                        destinationVC.book_description = self.book_description!
                        destinationVC.book_title = self.book_title
                        destinationVC.book_author = self.book_author
                        destinationVC.amazon = self.amazon
                        destinationVC.review = self.review
                
                
                if let navigator = self.navigationController {
                    navigator.pushViewController(destinationVC, animated: true)
                }
                
                
            }
            
            
    
            
        }
        
        
        
        
        
    }

   

}
