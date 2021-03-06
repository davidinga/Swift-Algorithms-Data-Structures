//
//  DoublyLinkedList.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 5/25/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

public class DoublyLinkedList<Element> {
    private var head: DoublyLinkedListNode<Element>?
    private var tail: DoublyLinkedListNode<Element>?
    
    public var first: DoublyLinkedListNode<Element>? {
        return head
    }
    
    public var last: DoublyLinkedListNode<Element>? {
        return tail
    }
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var count: Int {
        var node = head
        var count = 0
        while node != nil {
            count += 1
            node = node!.next
        }
        return count
    }
    
    public func append(_ element: Element) {
        let node = DoublyLinkedListNode(element)
        if isEmpty {
            head = node
        } else {
            node.prev = tail
            tail!.next = node
        }
        tail = node
    }
    
    public func index(of element: Int) -> DoublyLinkedListNode<Element>? {
        if element < 0, head == nil {
            return nil
        }
        var node = head
        for _ in 0..<element {
            node = node!.next
        }
        return node
    }
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    public func remove(at index: Int) -> DoublyLinkedListNode<Element>? {
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
    
    public func remove(node: DoublyLinkedListNode<Element>) -> DoublyLinkedListNode<Element>? {
        let prev = node.prev
        let next = node.next
        
        // Removing element inbetween head and tail
        if let prev = prev {
            prev.next = next
        } else {
            
        // Removing head
            head = next
        }
        
        next?.prev = prev

        // Removing tail
        if next == nil {
            tail = prev
        }
        
        node.prev = nil
        node.next = nil
        
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
