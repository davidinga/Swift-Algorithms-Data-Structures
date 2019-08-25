//
//  Vertex.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 6/19/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

public struct Vertex<Element: Hashable> {
    var data: Element
}

extension Vertex: Hashable {
    public static func ==(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.data == rhs.data
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(data)
    }
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(data)"
    }
}
