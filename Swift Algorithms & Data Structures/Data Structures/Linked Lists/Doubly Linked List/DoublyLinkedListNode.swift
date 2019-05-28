//
//  DoublyLinkedListNode.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 5/25/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

class DoublyLinkedListNode<Element> {
    var prev: DoublyLinkedListNode<Element>?
    var next: DoublyLinkedListNode<Element>?
    var element: Element
    
    init(_ element: Element) {
        self.element = element
    }
}
