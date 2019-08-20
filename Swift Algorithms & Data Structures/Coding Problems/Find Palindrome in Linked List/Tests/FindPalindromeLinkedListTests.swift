//
//  FindPalindromeLinkedListTests.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 7/7/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

class FindPalindromeLinkedListTests {
    init() {
        print("Testing Find Palindrome in Linked List...")
        print()
        let list = SinglyLinkedList<String>()
        list.append("4")
        list.append("3")
        list.append("1")
        list.append("3")
        list.append("4")
        print(isPalindrome(list) ? "It's a palindrome!" : "This is not a palindrome.")
        print()
    }
}
