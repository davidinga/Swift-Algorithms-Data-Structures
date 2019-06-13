//
//  InsertionSort.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 6/12/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

extension Array where Element: Comparable {
    
    mutating func insertionSort() {
        
        for (i, element) in self.enumerated() {
            var i = i
            while i > 0 && element < self[i - 1] {
                self[i] = self[i - 1]
                i -= 1
            }
            self[i] = element
        }
    }
}
