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

    public func traverseInOrder(process: (String) -> Void = { _ in }) {
        if case let .node(left, right, value) = self {
            left.traverseInOrder(process: process)
            process(value)
            print(value + " ", terminator: "")
            right.traverseInOrder(process: process)
        }
    }
    
    public func traversePreOrder(process: (String) -> Void = { _ in }) {
        if case let .node(left, right, value) = self {
            process(value)
            print(value + " ", terminator: "")
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        }
    }
    
    public func traversePostOrder(process: (String) -> Void = { _ in }) {
        if case let .node(left, right, value) = self {
            left.traversePostOrder(process: process)
            right.traversePostOrder(process: process)
            process(value)
            print(value + " ", terminator: "")
        }
    }
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
    var obj: TreeString {
        return TreeString()
    }
    
    // Stores the string tree
    var asString:String { return obj.treeString(self){("\($0.get?.value ?? "")",$0.get?.leftChild ?? nil,$0.get?.rightChild ?? nil)}  }
}
