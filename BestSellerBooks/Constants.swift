//
//  Constants.swift
//  BestSellerBooks
//
//  Created by Chinmay Dighe on 11/28/17.
//  Copyright © 2017 chinmaydighe. All rights reserved.
//

import Foundation



let BASE_URL = "https://api.nytimes.com/svc/books/v3/lists.json"
let API_KEY = "40a537c7b5ca4ae6930fbad3798e66e2"

let GOOGLE_URL = "https://www.googleapis.com/books/v1/volumes?q=isbn:"

typealias DownloadComplete = () -> () 
