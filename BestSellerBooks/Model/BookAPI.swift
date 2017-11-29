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
    
    
    
    init(bookDetails: Dictionary<String,AnyObject>){
        

            
            if let result = bookDetails as? Dictionary<String,AnyObject> {
                
                
                if let bookIsbn = result["isbns"] as? [Dictionary<String,String>] {
                    
                    
                    if let isbn = bookIsbn[0]["isbn10"] {
                        
                        self._isbn = isbn
                        //print(self._isbn)
                    }
                    
                    
                }
                
                
                if let rank = result["rank"] as? Int {
                    
                    
                        self._rank = rank 
                    
                    
                }
                
                if let wol = result["weeks_on_list"] as? Int {
                    
                    
                    self._weekOnList = wol
                    
                    
                }
                
                
                if let bookDetails = result["book_details"] as? [Dictionary<String,AnyObject>] {
                    
                    
                    
                    if let book_title = bookDetails[0]["title"] as? String {
                        
                        self._bookTitle = book_title
                       // print(self._bookTitle)
                        
                    }
                    
                    if let descrip = bookDetails[0]["description"] as? String{
                        
                        self._description = descrip
                       // print(self._description)
                        
                    }
                    
                    if let book_author = bookDetails[0]["author"] as? String{
                        
                        self._author = book_author
                        //print(self._author)
                    }
                    
                    
                
                    
                    
                }
                
            }
        
    }
    
    
   
    
    
}
