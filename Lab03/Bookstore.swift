//
//  Bookstore.swift
//  Lab03
//
//  Created by Leo Vergnetti on 2/28/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import Foundation

class Bookstore{
    var books = [Book : Int]()
    // a failable nitializer that creates a new, empty Bookstore object.
    public init?() {
        
    }
    // Adds a new Book b to the stock of the Bookstore object.
    public func addNewBook(b:Book) {
        books.append(b)
    }
    // Adds quantity number of books to the book already in stock in the Bookstore object with // the title title. If the book is not in the Bookstore object, nothing is done.
    public func addBookQuantity(title:String, quantity:Int) {
        books.    }
    // Returns true if quantity or more copies of a book with the title are contained in the Bookstore object.
    public inStock(title:String, quantity:Int)->Bool
    // Executes selling quantity number of books from the Bookstore object with the title to the
    // buyer. (Note: there is no I/O done in this method, the Bookstore object is changed to reflect // the sale. The method returns true is the sale was executed successfully, false otherwise. public sellBook(title:String, quantity:Int)->Bool
    // Lists all of the titles of the books in the Bookstore object.
    public listTitles()
    // Lists all of the information about the books in the Bookstore object.
    public listBooks()
    // Returns the total gross income of the Bookstore object.
    public getIncome()->Double
    
}
