//
//  BookAPI.swift
//  BestSellerBooks
//
//  Created by Chinmay Dighe on 11/28/17.
//  Copyright © 2017 chinmaydighe. All rights reserved.
//

import Foundation
import Alamofire


class BookAPI {
    
    
    var _bookTitle: String!
    var _description: String!
    var _author: String!
    var _isbn: String!
    var _bookCoverURL: String!
    var _rank: Int!
    var _weekOnList: Int!
    var _amazonURL: String!
    var _nytimesURL: String!
    
    var book: BookDetailModel!
    
    
    var booksArray = [BookDetailModel]()
    

    
    var bookTitle: String {
        
        if _bookTitle == nil{
            
            _bookTitle = ""
            
        }
        
        return _bookTitle
        
        
    }
    
    
    var description: String {
        
        
        if _description == "nil"{
            
                _description = ""
            
        }
        
        return _description
    }
    
    
    var author: String {
        
        if _author == nil {
            
            _author = ""
        }
        
        return _author
        
    }
    
    var isbn: String {
        
        if _isbn == nil {
            
            _isbn = ""
        }
        
        return _isbn
        
    }
    
    var rank: Int {
        
        if _rank == nil{
            
            return 0;
        }
        
        return _rank
    }
    
    var weekOnList: Int {
        
        if _weekOnList == nil {
            
            return 0
            
        }
        
            return _weekOnList
        
    }
    
    var amazonURL: String {
        
        if _amazonURL == nil {
            
            return ""
            
        }
        
        return _amazonURL
        
    }
    
    var nytimeURL: String {
        
        if _nytimesURL == nil {
            
            return ""
            
        }
        
        return _nytimesURL
        
    }
    
    
    
    init(bookDetails: Dictionary<String,AnyObject>){
        

            
            if let result = bookDetails as? Dictionary<String,AnyObject> {
                
                
                if let bookIsbn = result["isbns"] as? [Dictionary<String,String>] {
                    
                    
                    if let isbn = bookIsbn[0]["isbn10"] {
                        
                        self._isbn = isbn
                     
                    }
                    
                    
                }
                
                
                if let rank = result["rank"] as? Int {
                    
                    
                        self._rank = rank 
                    
                    
                }
                
                if let wol = result["weeks_on_list"] as? Int {
                    
                    
                    self._weekOnList = wol
                    
                    
                }
                
                if let amazon = result["amazon_product_url"] as? String {
                    
                    
                    self._amazonURL = amazon
                    
                    
                }
                
                
                if let bookDetails = result["book_details"] as? [Dictionary<String,AnyObject>] {
                    
                    
                    
                    if let book_title = bookDetails[0]["title"] as? String {
                        
                        self._bookTitle = book_title
                       
                        
                    }
                    
                    if let descrip = bookDetails[0]["description"] as? String{
                        
                        self._description = descrip
                      
                        
                    }
                    
                    if let book_author = bookDetails[0]["author"] as? String{
                        
                        self._author = book_author
                       
                    }
     
                    
                }
                
                
                if let reviews = result["reviews"] as? [Dictionary<String,AnyObject>] {
                    
                    
                    if let rev_link = reviews[0]["book_review_link"] as? String {
                        
                            self._nytimesURL = rev_link
                        
                        
                    }
                    
                    
                    
                    
                }
                
            }
        
    }
    
    
   
    
    
}
