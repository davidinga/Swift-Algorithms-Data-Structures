//
//  LinkedList.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 5/24/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

class LinkedList<Element> {
    var head: Node<Element>?
    var tail: Node<Element>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: Node<Element>? {
        return head
    }
    
    var last: Node<Element>? {
        return tail
    }
    
    func append(_ element: Element) {
        let newNode = Node.init(element)
        if tail != nil {
            tail!.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    func index(of element: Int) -> Node<Element>? {
        if element < 0, head == nil {
            return nil
        }
        var node = head
        for _ in 0..<element {
            node = node!.next
        }
        return node
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
    
    func remove(at index: Int) -> Element? {
        var node = head
        var prevNode = node
        var nextNode = node
        var element: Element?
        for i in 0...index {
            if i == index {
                // Element to remove is head.
                if index == 0 {
                    head = head!.next
                }
                    // Element to remove is tail.
                else if node!.next == nil {
                    tail = prevNode
                    tail!.next = nil
                }
                    // Element to remove is in between head and tail.
                else if let next = node!.next {
                    nextNode = next
                    prevNode!.next = nextNode
                }
                element = node!.element
            } else {
                prevNode = node
            }
            node = node!.next
        }
        return element
    }
    
}
