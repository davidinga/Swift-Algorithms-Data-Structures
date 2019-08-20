//
//  RadixSortTests.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 8/20/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

class RadixSortTests {
    init() {
        print("Testing Radix Sort...")
        print()
        print("Creating array of: [9, 9, 3, 4, 5, 3, 44, 83, 20, 40, 21, 2888, 283, 294, 222, 11222, 44444, 2984, 24, 24, 3, 1]")
        var elements = [9, 9, 3, 4, 5, 3, 44, 83, 20, 40, 21, 2888, 283, 294, 222, 11222, 44444, 2984, 24, 24, 3, 1]
        print("Running Radix Sort direclty on the array.")
        elements.insertionSort()
        print(elements)
        print()
    }
}
