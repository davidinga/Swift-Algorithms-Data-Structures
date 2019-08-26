//
//  SimpleLinkedList.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 8/26/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

class SimpleLinkedList<Element> {
    var head: SimpleNode<Element>?
    var tail: SimpleNode<Element>?
    
    func append(_ element: Element) {
        let node = SimpleNode(element)
        
        if tail != nil {
            tail!.next = node
        } else {
            head = node
        }
        
        tail = node
    }
}
