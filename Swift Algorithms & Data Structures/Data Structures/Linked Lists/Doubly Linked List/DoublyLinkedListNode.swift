//
//  DoublyLinkedListNode.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 5/25/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

public class DoublyLinkedListNode<Element> {
    public var prev: DoublyLinkedListNode<Element>?
    public var next: DoublyLinkedListNode<Element>?
    public var element: Element
    
    init(_ element: Element) {
        self.element = element
    }
}
