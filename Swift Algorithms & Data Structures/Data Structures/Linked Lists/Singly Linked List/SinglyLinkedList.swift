//
//  SinglyLinkedList.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 5/24/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

class SinglyLinkedList<Element> {
    var head: SinglyLinkedListNode<Element>?
    var tail: SinglyLinkedListNode<Element>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: SinglyLinkedListNode<Element>? {
        return head
    }
    
    var last: SinglyLinkedListNode<Element>? {
        return tail
    }
    
    func append(_ element: Element) {
        let newNode = SinglyLinkedListNode(element)
        if tail != nil {
            tail!.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    func index(of element: Int) -> SinglyLinkedListNode<Element>? {
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
        //TODO: Remove prevNode and nextNode
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

extension SinglyLinkedList: CustomStringConvertible {
    
    public var description: String {
        
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node!.element)"
            node = node!.next
            if node != nil { text += ", " }
        }
        return text + "]"
    }
    
}
