// THIS DESIGN IS ACTUALLY AWFUL
// THE BOOK CLASS IS KEEPING TRACK OF HOW MANY OF ITSELF IT HAS
// THE BOOKSTORE CLASS CONTAINS CONTRAINTS(MAX NUMBER OF BOOKS?) NOT PRESENT IN DESCRIPTION
// CREATES A TIGHTLY COUPLED DESIGN (IE WHAT SHOULD HAPPEN IF BOOK QUANTITY GOES TO 0? SHOULD
// IT BE REMOVED FROM THE STORE? HOW SHOULD THE STORE KNOW TO REMOVE A BOOK IF ITS NOT AWARE OF
// THE QUANTITY. SHOULD THE ENTRY REMAIN? WHY HAVE AN ADD BOOK OPTION AT ALL?
// QUANTITY SHOULD BE REMOVED FROM THE BOOK CLASS:
// A DICTIONARY SHOULD BE USED IN THE BOOKSTORE CLASS, EITHER BY IMPLEMENTING EQUATABLE / HASHABLE,
// AND USING THE BOOK ITSELF AS THE KEY, WITH AN INTEGER (QUANTITY) AS ITS VALUE, OR
// SIMPLY USE BOOK.TITLE AS KEY AND MAINTAIN A SEPARATE DICTIONARY WITH BOOK.TITLE AS KEY AND
// BOOK OBJECT AS VALUE.
//

import Foundation

class Bookstore{
    var books = [Book]()
    var grossIncome = 0.0
    
    /** OMITTED : a failable nitializer that creates a new, empty Bookstore object. */

    /** Adds a new Book b to the stock of the Bookstore object. If the book is already in stock, the quantity is incremented */
    public func addNewBook(b:Book) {
       books.append(b)
    }
    /**Adds quantity number of books to the book already in stock in the Bookstore object with the title . If the book is not in the Bookstore object, nothing is done. */
    public func addBookQuantity(title: String, quantity: Int) {
        if let book = books.first(where: {$0.getTitle() == title}){
            book.addQuantity(amount: quantity)
        }
    }
    /** Returns true if quantity or more copies of a book with the title are contained in the Bookstore object.*/
    public func inStock(title: String, quantity: Int) -> Bool{
         let book = books.first(where: {$0.getTitle() == title && $0.getQuantity() >= quantity})
        return book != nil ? true : false
    }
    
     /** Executes selling quantity number of books from the Bookstore object with the title to the
     buyer. (Note: there is no I/O done in this method, the Bookstore object is changed to reflect
     the sale. The method returns true is the sale was executed successfully, false otherwise.*/
    public func sellBook(title: String, quantity: Int) -> Bool {
        if inStock(title: title, quantity: quantity){
            if let book = books.first(where: {$0.getTitle() == title }){
                book.subtractQuantity(amount: quantity)
                grossIncome += Double(quantity) * book.getPrice()
                return true
            }
        }
        return false
    }
    /**Lists all of the titles of the books in the Bookstore object.*/
    public func listTitles(){
        books.forEach{ print($0.getTitle()) }
    }
    /** Lists all of the information about the books in the Bookstore object.*/
    public func listBooks(){
        books.forEach{print($0.toString())}
    }
    
    /** Returns the total gross income of the Bookstore object.*/
    public func getIncome()->Double{
        return grossIncome
    }
    
}
