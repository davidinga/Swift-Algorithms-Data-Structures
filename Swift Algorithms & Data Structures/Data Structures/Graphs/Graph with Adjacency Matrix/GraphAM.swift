//
//  GraphAM.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 8/25/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

public struct GraphAM {
    private var adjMatrix = [[Int?]]()
    private var numberOfVertices: Int {
        return adjMatrix.count
    }

    init(numberOfVertices: Int) {
        adjMatrix = Array(repeating: Array(repeating: nil, count: numberOfVertices), count: numberOfVertices)
    }
    
    public mutating func addEdge(from source: Int, to destination: Int, with weight: Int? = nil) {
        adjMatrix[source][destination] = weight ?? 1
    }
    
    public mutating func removeEdge(from source: Int, to destination: Int) {
        if source < numberOfVertices && destination < numberOfVertices {
            adjMatrix[source][destination] = nil
            adjMatrix[destination][source] = nil
        }
    }
    
    public func isEdge(from source: Int, to destination: Int) -> Bool {
        return adjMatrix[source][destination] != nil
    }
}

extension GraphAM: CustomStringConvertible {
    public var description: String {
        var result = ""
        for i in 0..<numberOfVertices {
            if i == numberOfVertices {
                result += "\n"
            }
            if i == 0 {
                result += "  "
                for j in 0..<numberOfVertices {
                    result += "\(j) "
                }
                result += "\n"
            } else {
                result += "\(i) "
            }
            for (j, value) in adjMatrix[i].enumerated() {
                if j == 0 && i == 0 {
                    result += "\(j) "
                }
                result += "\(value ?? 0) "
            }
            result += "\n"
        }
        return result
    }
}
