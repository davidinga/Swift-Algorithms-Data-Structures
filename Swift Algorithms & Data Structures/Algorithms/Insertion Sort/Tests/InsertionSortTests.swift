//
//  InsertionSortTests.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 6/12/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

class InsertionSortTests {
    init() {
        print("Testing Insertion Sort...")
        print()
        print("Creating array of: [11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]")
        var elements = [11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
        print("Running Insertion Sort direclty on the array.")
        elements.insertionSort()
        print(elements)
        print()
    }
}
