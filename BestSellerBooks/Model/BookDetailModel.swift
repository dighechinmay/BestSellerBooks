//
//  BookDetailModel.swift
//  BestSellerBooks
//
//  Created by Chinmay Dighe on 11/28/17.
//  Copyright © 2017 chinmaydighe. All rights reserved.
//

import Foundation




class BookDetailModel {
    
    
    var bookName: String!
    var authorName: String!
    var image: String!
    var rank: Int!
    
    
    init(bName: String,aName: String!,rank: Int,image: String!){
        
            self.bookName = bName
            self.authorName = aName
            self.image = image
            self.rank = rank
        
    }
    
    
    
    
}
