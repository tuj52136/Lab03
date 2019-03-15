//
//  main.swift
//  Lab03
//
//  Created by Leo Vergnetti on 2/28/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import Foundation

let bookstore = Bookstore()

func printGreeting(){
    print("[][][][][][][][][][][][][][][][][][][][][][][][][][][]")
    print("[][][]  [][] Welcome to Temple Bookstore! [][]  [][][]")
    print("[][][][][][][][][][][][][][][][][][][][][][][][][][][]")
}
func printMainMenu(){
    print("======================================================")
    print("What would you like to do today?")
    print("1. Add a book")
    print("2. Sell a book")
    print("3. List of all titles")
    print("4. List all information")
    print("5. Print out gross income")
    print("6. Quit")
}

func getUserInput() -> Int? {
    if let input = readLine(), let option = Int(input), (1 ... 6).contains(option){
        return option
    }
    print("Enter a valid option")
    return nil
}

func executeUserInput(option : Int) {
    switch option {
    case 1:
        print("Add a book")
        getBookInfoToAddABook()
    case 2:
        print("Sell a book")
        sellABook()
    case 3:
        print("Titles of Books")
        print("===============")
        bookstore.listTitles()
    case 4:
        print("List of Books")
        print("===============")
        bookstore.listBooks()
    case 5:
        print("Total Income: $\(bookstore.getIncome())")
    case 6:
        print("Quit")
    default:
        print("Not a valid option")
    }
}

/** This trashbag method*/
func getBookInfoToAddABook(){
    print("What is the title of the book?")
    let title = readLine()!.capitalized
    if !title.isEmpty{
        //IF BOOK IS NOT IN STOCK GET PAGES AND PRICE AND ADD 0 QUANTITY
        if !bookstore.inStock(title: title, quantity: 1){
            print("Java How many pages is it?")
            if let pagesInput = Int(readLine()!){
                print("What is the price?")
                if let priceInput = Double(readLine()!){
                    print("Quantity?")
                    if let quantityInput = Int(readLine()!){
                        if let book = Book(theTitle: title, pages: pagesInput, cost: priceInput, num: quantityInput){
                            bookstore.addNewBook(b: book)
                            print("Book is now in stock")
                        }else{
                            print("Invalid input, please try again")
                        }
                    }else{
                        print("Quantity must be a whole number")
                    }
                }else{
                    print("Price must be a decimal")
                }
            }else{
                print("Pages must be a whole number")
            }
        }else{
            print("Quantity?")
            if let quantityInput = Int(readLine()!), quantityInput > 0{
                bookstore.addBookQuantity(title: title, quantity: quantityInput)
                print("Added \(quantityInput) new \(title) books")
            } else{
                print("Invalid quantity")
            }
        }
    }else {
        print("All books must have a title")
    }
    
}

func sellABook(){
    print("Which book would you like to sell?")
    let title = readLine()!.capitalized
    if !title.isEmpty{
        print("How many copies will be sold?")
        if let number = Int(readLine()!){
            if(bookstore.sellBook(title: title, quantity: number)){
                 print("Success! You have sold \(number) copies(s) of \(title).")
            }else{
                print("Unable to complete purchase")
            }
        }else{
            print("Quantity must be a whole number")
        }
    }else{
        print("Please provide a title")
    }
    
}

/**
 MAIN LOOP
 */
printGreeting()
while(true){
    printMainMenu()
    if let userInput = getUserInput(){
        if userInput == 6{
            print("Quitting!")
            break
        }
        executeUserInput(option: userInput)
    }
}



