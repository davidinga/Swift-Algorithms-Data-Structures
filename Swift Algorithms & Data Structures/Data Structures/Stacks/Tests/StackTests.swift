//
//  StackTests.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 5/28/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

class StackTests {
    init() {
        print("Testing Stack...")
        var stack = Stack<Int>()
        print("Push 5, 4, 3, 2, 1")
        stack.push(5)
        stack.push(4)
        stack.push(3)
        stack.push(2)
        stack.push(1)
        print("Stack count: \(stack.count)")
        stack.isEmpty ? print("The stack is empty.") : print("The stack has elements!")
        print("Peek at stack: \(stack.peek()!)")
        print("Pop stack: \(stack.pop()!)")
        print("")
    }
}
