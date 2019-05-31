//
//  Queue.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 5/29/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

public struct Queue<Element> {
    fileprivate let queue = SinglyLinkedList<Element>()
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    var count: Int {
        return queue.count
    }
    
    mutating func enqueue(_ element: Element) {
        queue.append(element)
    }
    
    mutating func dequeue() -> SinglyLinkedListNode<Element>? {
        return queue.remove(node: queue.first!)
    }
    
    func peek() -> SinglyLinkedListNode<Element>? {
        return queue.first!
    }

}
