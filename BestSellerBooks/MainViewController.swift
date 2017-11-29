//
//  MainViewController.swift
//  BestSellerBooks
//
//  Created by Chinmay Dighe on 11/28/17.
//  Copyright © 2017 chinmaydighe. All rights reserved.
//

import UIKit
import Alamofire

class MainViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    
    @IBOutlet weak var bookListTableView: UITableView!
    


    var bookData: BookDetailModel!
    var bookArray = [BookDetailModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
      
        bookListTableView.dataSource = self
        bookListTableView.delegate = self 
       
        downloadBookData()

        
    }


  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
  
    
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as? HeaderTableViewCell {
    
        cell.configureHeaderCell(headerName: "Hardcore Fiction")
        
        return cell
    }
    else{
        
        return HeaderTableViewCell()
        
    }
    
    
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
       if let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as? BookTableViewCell {
        
        let book = self.bookArray[indexPath.row]
        
        cell.configureBookCell(author: book.authorName,title: book.bookName,rank: book.rank,imageURL: "")
      
        return cell
            
        }
        else {
            
            return BookTableViewCell()
            
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
            cell.contentView.backgroundColor = .random()
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    
        self.performSegue(withIdentifier: "showBookDetails", sender: indexPath);
        
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if(segue.identifier == "showBookDetails"){
            
            
            let destinationVC = segue.destination as! BookDetailsViewController
                let row = (sender as! NSIndexPath).row
            
                let book = self.bookArray[row]
            
                destinationVC.book_title = book.bookName
                destinationVC.book_author = book.authorName
                destinationVC.book_description = book.description
            
            
            
        }
        
    }
    
    
    
    
    
    
    func  downloadBookData(){
        
        
     
                let parameters: Parameters = ["api-key": API_KEY,"list": "Hardcover Fiction"]
                Alamofire.request(BASE_URL, parameters: parameters).responseJSON { response in
                    
                    
                    if let books = response.value as? Dictionary<String,AnyObject> {
                        
                        
                        
                          if let results = books["results"] as? [Dictionary<String,AnyObject>] {
                            
                               for book in results {
                                
                                        let oneBook = BookAPI(bookDetails: book)
                                let bookVar = BookDetailModel(bName: oneBook.bookTitle, aName: oneBook.author,rank: oneBook.rank,image: "")
                                        self.bookArray.append(bookVar)
                                        self.bookListTableView.reloadData()
                                
                               }
                            
                          }
                    
                      }
                    

        }
        
    }
}



extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}