//
//  Heap.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 6/10/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

public struct Heap<Element> {
    var elements: [Element]
    var priorityFunction: (Element, Element) -> Bool
    
    init(elements: [Element] = [], priorityFunction: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        buildHeap()
    }
    
    mutating func buildHeap() {
        for index in (0 ..< count / 2).reversed() {
            trickleDown(at: index)
        }
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    func isRoot(_ index: Int) -> Bool {
        return index == 0
    }
    
    func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }
    
    func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2
    }
    
    func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    
    func highestPriority(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count, isHigherPriority(at: childIndex, than: parentIndex)
            else { return parentIndex }
        return childIndex
    }
    
    func hightestPriority(at parentIndex: Int) -> Int {
        return highestPriority(of: highestPriority(of: parentIndex, and: leftChildIndex(of: parentIndex)), and: rightChildIndex(of: parentIndex))
    }
    
    mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex
            else { return }
        let firstIndex = firstIndex
        let secondIndex = secondIndex
        elements.swapAt(firstIndex, secondIndex)
    }
    
    mutating func bubbleUp(at index: Int) {
        guard !isRoot(index), isHigherPriority(at: index, than: parentIndex(of: index))
            else { return }
        swapElement(at: index, with: parentIndex(of: index))
        bubbleUp(at: parentIndex(of: index))
    }
    
    mutating func trickleDown(at index: Int) {
        let childIndex = hightestPriority(at: index)
        if index == childIndex {
            return
        }
        swapElement(at: index, with: childIndex)
        trickleDown(at: childIndex)
    }
    
    mutating func insert(_ element: Element) {
        elements += [element]
        bubbleUp(at: count - 1)
    }
    
    mutating func extract() -> Element? {
        guard !isEmpty
            else { return nil }
        swapElement(at: 0, with: count - 1)
        let element = elements.removeLast()
        if !isEmpty {
            trickleDown(at: 0)
        }
        return element
    }
    
}

extension Heap {
    
    var obj: HeapString {
        return HeapString()
    }
    
    func printHeapTree(reversed:Bool = false) {
        let tree = obj.treeString( 0, reversed:reversed ) {
            let left  = { $0 < self.count ? $0 : nil}($0 * 2 + 1)
            let right = { $0 < self.count ? $0 : nil}($0 * 2 + 2)
            return ( "\(self.elements[$0])", left, right )
        }
        print(tree)
    }
}
