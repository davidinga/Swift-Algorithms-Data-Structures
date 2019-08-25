//
//  Edge.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 6/19/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

public enum EdgeType {
    case directed, undirected
}

public struct Edge<Element: Hashable> {
    var source: Vertex<Element>
    var destination: Vertex<Element>
    var weight: Double?
}

extension Edge: Hashable {
    public static func ==(lhs: Edge, rhs: Edge) -> Bool {
        return lhs.source == rhs.source && lhs.destination == rhs.destination && lhs.weight == rhs.weight
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(source)
        hasher.combine(destination)
        hasher.combine(weight)
    }
}
