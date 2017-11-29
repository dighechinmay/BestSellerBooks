//
//  BookCoverModel.swift
//  BestSellerBooks
//
//  Created by Chinmay Dighe on 11/29/17.
//  Copyright © 2017 chinmaydighe. All rights reserved.
//

import Foundation



class BookCoverModel {
    
    
    var _imageURL: String!
    
    
    
    
    var imageURL: String {
        
        if _imageURL == nil {
            
            return ""
            
            
        }
        
        
        return _imageURL
        
        
    }
    
    
    init(coverDetails: Dictionary<String,AnyObject>){
        
        if  let items = coverDetails["items"] as? [Dictionary<String,AnyObject>] {
         
            
            if let volumeInfo = items[0]["volumeInfo"] as? Dictionary<String,AnyObject>{
                
                
                
                if let imageLinks = volumeInfo["imageLinks"] as? Dictionary<String,AnyObject>{
                    
                    
                    if let url = imageLinks["smallThumbnail"] as? String {
                        
                                self._imageURL = url
                        
                    }
                    
                }
            
                
            }
            
        }
    
    }
}
