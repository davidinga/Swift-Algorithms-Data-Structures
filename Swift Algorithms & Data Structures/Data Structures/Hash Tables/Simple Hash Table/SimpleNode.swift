//
//  SimpleNode.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 8/26/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

class SimpleNode<Element> {
    var data: Element
    var next: SimpleNode<Element>?
    
    init(_ data: Element) {
        self.data = data
    }
}
