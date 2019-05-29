//
//  StackWithLinkedListTests.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 5/28/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

class StackWithLinkedListTests {
    init() {
        print("Testing Stack with Linked List...")
        var stack = StackWithLinkedList<String>()
        print("Push Bun, Burger, Onion, Lettuce, Ketchup, Sesame Bun.")
        stack.push("Bun")
        stack.push("Burger")
        stack.push("Onion")
        stack.push("Lettuce")
        stack.push("Ketchup")
        stack.push("Sesame Bun")
        print("Peek: \(stack.peek()!.element)")
        print("isEmpty: \(stack.isEmpty)")
        print("Count: \(stack.count)")
        print("Pop: \(stack.pop()!.element)")
        print("Count: \(stack.count)")
        print("Peek: \(stack.peek()!.element)")
        print()
    }
}
