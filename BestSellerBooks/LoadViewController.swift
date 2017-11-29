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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
       // navigationItem.leftBarButtonItem = backButton
        
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
                
                
                if let navigator = self.navigationController {
                    navigator.pushViewController(destinationVC, animated: true)
                }
                
                
            }
            
            
    
            
        }
        
        
        
        
        
    }

   

}