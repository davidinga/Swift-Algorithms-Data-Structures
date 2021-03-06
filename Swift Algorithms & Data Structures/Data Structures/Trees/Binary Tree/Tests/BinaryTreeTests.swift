//
//  BinaryTreeTests.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 6/6/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

class BinaryTreeTests {
    init() {
        print("Testing Binary Tree...")
        
        // leaf nodes
        let node5 = BinaryTree.node(leftChild: .empty, rightChild: .empty, value: "5")
        let nodeA = BinaryTree.node(leftChild: .empty, rightChild: .empty, value: "a")
        let node10 = BinaryTree.node(leftChild: .empty, rightChild: .empty, value: "10")
        let node4 = BinaryTree.node(leftChild: .empty, rightChild: .empty, value: "4")
        let node3 = BinaryTree.node(leftChild: .empty, rightChild: .empty, value: "3")
        let nodeB = BinaryTree.node(leftChild: .empty, rightChild: .empty, value: "b")
        
        // intermediate nodes on the left
        let Aminus10 = BinaryTree.node(leftChild: nodeA, rightChild: node10, value: "-")
        let timesLeft = BinaryTree.node(leftChild: node5, rightChild: Aminus10, value: "*")
        
        // intermediate nodes on the right
        let minus4 = BinaryTree.node(leftChild: .empty, rightChild: node4, value: "-")
        let divide3andB = BinaryTree.node(leftChild: node3, rightChild: nodeB, value: "/")
        let timesRight = BinaryTree.node(leftChild: minus4, rightChild: divide3andB, value: "*")
        
        // root node
        let tree = BinaryTree.node(leftChild: timesLeft, rightChild: timesRight, value: "+")
        
        print(tree.asString)
        
        // leaf nodes
        let d = BinaryTree.node(leftChild: .empty, rightChild: .empty, value: "d")
        let e = BinaryTree.node(leftChild: .empty, rightChild: .empty, value: "e")
        let f = BinaryTree.node(leftChild: .empty, rightChild: .empty, value: "f")
        let g = BinaryTree.node(leftChild: .empty, rightChild: .empty, value: "g")
        
        // intermediate nodes
        let b = BinaryTree.node(leftChild: d, rightChild: e, value: "b")
        let c = BinaryTree.node(leftChild: f, rightChild: g, value: "c")
        
        // root
        let root = BinaryTree.node(leftChild: b, rightChild: c, value: "a")
        
        print(root.asString)
        print()
        
        let three = BinaryTree.node(leftChild: .empty, rightChild: .empty, value: "3")
        let eight = BinaryTree.node(leftChild: .empty, rightChild: .empty, value: "8")
        let eleven = BinaryTree.node(leftChild: .empty, rightChild: .empty, value: "11")
        
        let four = BinaryTree.node(leftChild: three, rightChild: .empty, value: "4")
        let ten = BinaryTree.node(leftChild: eight, rightChild: eleven, value: "10")
        
        let five = BinaryTree.node(leftChild: four, rightChild: ten, value: "5")
        
        print(five.asString)
        print()
        
        print("In Order Traversal")
        print("______________________________")
        five.traverseInOrder()
        print()
        print()
        
        print("Pre Order Traversal")
        print("______________________________")
        five.traversePreOrder()
        print()
        print()
        
        print("Post Order Traversal")
        print("______________________________")
        five.traversePostOrder()
        print()
        print()

    }
}
