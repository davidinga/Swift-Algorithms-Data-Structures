//
//  FindPalindromeLinkedList.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 7/7/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

/*
 Daily Coding Problem: Problem #104 [Easy]
 
 This problem was asked by Google.
 
 Determine whether a doubly linked list is a palindrome. What if it’s singly linked?
 
 For example, 1 -> 4 -> 3 -> 4 -> 1 returns True while 1 -> 4 returns False.
 */

//// Determines if a linked list is a palindrome. Both solutions work with a singly or
//// doubly linked list.
func isPalindrome(_ list: DoublyLinkedList<String>) -> Bool {
    // Simple solution. Iterate over linked list and store as string.
    // Uses linear space and time.
    // Then compare string to a reversed string.
    // If equal, then we have a palindrome.
    var node = list.first
    var string = ""
    while node != nil {
        string += String(node!.element)
        node = node!.next
    }
    return string == String(string.reversed())
}

func isPalindrome(_ list: SinglyLinkedList<String>) -> Bool {
    // Recursive solution. Uses constant space and linear time.
    // Checks first and last elements in linked list.
    // Removes elements from front and back until there
    // is one element, no elements, or an invalid palindrome is found.
    if list.isEmpty || list.first === list.last {
        return true
    }
    if list.first!.element == list.last!.element {
        _ = list.remove(node: list.first!)
        _ = list.remove(node: list.last!)
        return isPalindrome(list)
    }
    return false
}
