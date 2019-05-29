//
//  StackWithLinkedList.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 5/28/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

struct StackWithLinkedList<Element> {
    let stack = DoublyLinkedList<Element>()
    
    mutating func push(_ element: Element) {
        stack.append(element)
    }
    
    mutating func pop() -> DoublyLinkedListNode<Element>? {
        return stack.remove(node: stack.tail!)
    }
    
    func peek() -> DoublyLinkedListNode<Element>? {
        return stack.tail
    }
    
    var isEmpty: Bool {
        return stack.isEmpty
    }
    
    var count: Int {
        return stack.count
    }
}
