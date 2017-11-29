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
    var isbn: String!
    var description: String!
    var wol: Int!
    var amazon: String!
    var nytimes: String!
    
    
    init(bName: String,aName: String!,rank: Int,isbn: String,des: String,wol: Int,amazon: String,nytimes: String){
        
            self.bookName = bName
            self.authorName = aName
            self.isbn = isbn
            self.rank = rank
            self.description = des
            self.wol = wol
            self.amazon = amazon
            self.nytimes = nytimes
    }
    
    
    
    
}
