//
//  GraphAL.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 8/25/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

public struct GraphAL<Element: Hashable> {
    var adjList = [Element: GraphNode<Element>]()
    
    public mutating func addVertex(_ name: Element) {
        adjList[name] = GraphNode(name)
    }

    @discardableResult public mutating func addEdge(from source: Element, to destination: Element) -> Bool {
        guard adjList[source] != nil, adjList[destination] != nil
            else { return false }
        
        var node = GraphNode(destination)
        node.next = adjList[source]
        adjList[source] = node
        
        node = GraphNode(source)
        node.next = adjList[destination]
        adjList[destination] = node
        
        return true
    }
}

extension GraphAL: CustomStringConvertible {
    public var description: String {
        var result = ""
        for list in adjList {
            result += "Adjacency List of vertex \(list.key): \n head"
            var node = list.value
            while node.next != nil {
                result += " --> \(node.data)"
                node = node.next!
            }
            result += "\n"
        }
        return result
    }
}
