//
//  main.swift
//  Lab03
//
//  Created by Leo Vergnetti on 2/28/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import Foundation


func printGreeting(){
    print("[][][][][][][][][][][][][][][][][][][][][][][][][][][]")
    print("[][][]  [][] Welcome to Temple Bookstore! [][]  [][][]")
    print("[][][][][][][][][][][][][][][][][][][][][][][][][][][]")
}
func printMainMenu(){
    print("=====================================================")
    print("What would you like to do today?")
    print("1. Add a book")
    print("2. Sell a book")
    print("3. List of all titles")
    print("4. List all information")
    print("5. Print out gross income")
    print("6. Quit")
}

func getBookTitle(){
    print("What is the title of the book?")
    print("Java How many pages is it?")
    print("What is the price?")
    print("Quantity?")
    print("Book is now in stock.")
}

func sellBook(){
    print("Which book would you like to sell?")
    print("How many copies will be sold?")
    print("Success! You have sold 10 copies(s) of _______.")
}

printGreeting()
printMainMenu()




