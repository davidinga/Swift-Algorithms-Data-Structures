//
//  ReverseWordsInString.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 7/9/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

/*
 Daily Coding Problem: Problem #113 [Medium]

 This problem was asked by Google.
 
 Given a string of words delimited by spaces, reverse the words in string. For example, given "hello world here", return "here world hello"
 
 Follow-up: given a mutable string representation, can you perform this operation in-place?
 */

//// Reverse Words In A String
// Loops through string, adding characters to a word. Pushes words onto stack.
// Then pops words and adds to output string.
func reverseWordsInString(_ str: String) -> String {
    var word = ""
    var string = ""
    var stack = Stack<String>()
    for char in str {
        if char == " " {
            stack.push(word)
            word = ""
            continue
        }
        word += String(char)
    }
    stack.push(word)
    while !stack.isEmpty {
        string += stack.pop()! + (stack.isEmpty ?  "" : " ")
    }
    return string
}


