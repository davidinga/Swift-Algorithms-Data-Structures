//
//  HeapTests.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 6/12/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

class HeapTests {
    init() {
        print("Testing Heap...")
        print()
        print("Building Min-Heap with [1, 2, 3, 4, 5, 6, 7, 8].")
        
        var heap = Heap(elements: [1, 2, 3, 4, 5, 6, 7, 8], priorityFunction: <)
        heap.printHeapTree()
        print()
        print("Extracting highest priority element from heap: \(heap.extract() ?? 0)")
        heap.printHeapTree()
        print()
    }
}
