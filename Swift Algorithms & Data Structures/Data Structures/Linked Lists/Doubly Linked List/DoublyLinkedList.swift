//
//  DoublyLinkedList.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 5/25/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

class DoublyLinkedList<Element> {
    var head: DoublyLinkedListNode<Element>?
    var tail: DoublyLinkedListNode<Element>?
    var first: DoublyLinkedListNode<Element>? {
        return head
    }
    var last: DoublyLinkedListNode<Element>? {
        return tail
    }
    var isEmpty: Bool {
        return head == nil
    }
    func append(_ element: Element) {
        let node = DoublyLinkedListNode(element)
        if isEmpty {
            head = node
        } else {
            node.prev = tail
            tail!.next = node
        }
        tail = node
    }
    func index(of element: Int) -> DoublyLinkedListNode<Element>? {
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
    func remove(at index: Int) -> DoublyLinkedListNode<Element>? {
        var node = head
        for i in 0...index {
            if i == index {
                if index == 0 {
                    head = node!.next
                    head!.prev = nil
                }
                else if node!.next == nil {
                    tail = node!.prev
                    tail!.next = nil
                }
                else {
                    node!.prev!.next = node!.next
                    node!.next!.prev = node!.prev
                }
            }
            node = node!.next
        }
        return node
    }
}

extension DoublyLinkedList: CustomStringConvertible {
    
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
