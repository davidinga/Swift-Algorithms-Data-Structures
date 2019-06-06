//
//  BinaryTree.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 6/5/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

public indirect enum BinaryTree {
    case node(
        leftChild: BinaryTree,
        rightChild: BinaryTree,
        value: String
    )
    case empty
}

extension BinaryTree {
    
    // Gets the associated values and returns (value:leftChild:rightChild)
    var get: (value: String, leftChild: BinaryTree, rightChild: BinaryTree)? {
        switch self {
        case let .node(leftChild: leftChild, rightChild: rightChild, value: value):
            return (value, leftChild, rightChild)
        case .empty:
            return nil
        }
    }
    
    // Converts the tree into a string
    var print: TreeString {
        return TreeString()
    }
    
    // Stores the string tree
    var asString:String { return print.treeString(self){("\($0.get?.value ?? "")",$0.get?.leftChild ?? nil,$0.get?.rightChild ?? nil)}  }
}
