//
//  Book.swift
//  Lab03
//
//  Created by Leo Vergnetti on 2/28/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import Foundation

class Book : Equatable{
    
    static func == (lhs: Book, rhs: Book) -> Bool {
        return lhs.title == rhs.title
    }
    
    
    private var title: String
    private var numOfPages : Int
    private var price : Double
    private var quantity : Int

     /**a failable Initializer: Takes in the title of the book, the number of pages in the book, the cost of the book and the number of copies (quantity) of books and initializes each of the appropriate properties in the object.*/
    public init?(theTitle: String, pages:Int, cost:Double, num: Int) {
        if theTitle.isEmpty || pages < 0 || cost < 0 || num < 0{
            return nil
        }
        self.title = theTitle.capitalized
        self.numOfPages = pages
        self.price = cost
        self.quantity = num
    }
    
    /** Returns the title of the Book object the method is called on.*/
    public func getTitle()-> String {
            return title
    }
    /**Returns the price of the Book object the method is called on.*/
    public func getPrice()-> Double {
        return price
    }
    /** Returns the quantity of the Book object the method is called on.*/
    public func getQuantity()-> Int {
        return quantity
    }
    /** Returns all the information about a Book object as a String. (Add spaces or tabs to make it readable!)*/
    public func toString()-> String {
        return "\(title), has \(numOfPages) pages, costs $\(price) and there are \(quantity) in stock. "
    }
    /** Decrements the number of copies, by the given amount, for the Book object the method is called on.*/
    public func subtractQuantity(amount:Int) {
        if amount <= quantity, amount >= 0{
            quantity -= amount
        }
    }
    /**Increments the number of copies, with the given amount, for the Book object the method is called on.*/
    public func addQuantity(amount:Int) {
        if amount >= 0{
            quantity += amount
        }
    }
}
