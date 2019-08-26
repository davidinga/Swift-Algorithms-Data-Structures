//
//  GraphNode.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 8/25/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

public class GraphNode<Element: Hashable> {
    public var data: Element
    public var next: GraphNode<Element>?
    
    init(_ element: Element) {
        self.data = element
    }
}
