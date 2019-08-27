//
//  DepthFirstSearch.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 8/26/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

func depthFirstSearch(from start: Vertex<String>,
                      to end: Vertex<String>,
                      in graph: GraphOP<String> ) -> Stack<Vertex<String>> {
    
    var stack = Stack<Vertex<String>>()
    var visited = Set<Vertex<String>>()
    
    stack.push(start)
    visited.insert(start)
    
    outer: while let vertex = stack.peek(), vertex != end {

        guard let neighbors = graph.edges(from: vertex), neighbors.count > 0 else {
            stack.pop()
            continue
        }
        
        for edge in neighbors {
            if !visited.contains(edge.destination) {
                stack.push(edge.destination)
                visited.insert(edge.destination)
                continue outer
            }
        }
        
        stack.pop()
    }
    
    return stack
}
