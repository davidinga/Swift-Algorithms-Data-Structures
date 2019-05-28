//
//  SinglyLinkedListNode.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 5/24/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

class SinglyLinkedListNode<Element> {
    var element: Element
    var next: SinglyLinkedListNode<Element>?
    
    init(_ element: Element) {
        self.element = element
    }
}
