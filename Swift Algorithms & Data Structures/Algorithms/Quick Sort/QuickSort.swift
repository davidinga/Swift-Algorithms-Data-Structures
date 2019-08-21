//
//  QuickSort.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 8/20/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

extension Array where Element: Comparable {
    private func partition(array: inout [Element], low: Int, high: Int) -> Int {
        let pivot = array[high]
        var i = low - 1
        for j in low..<high {
            if array[j] <= pivot {
                i += 1
                array.swapAt(i, j)
            }
        }
        array.swapAt(i + 1, high)
        return i + 1
    }
    
    mutating func quickSort(low: Int = 0, high: Int? = nil) {
        let high = high ?? self.count - 1
        if low < high {
            let pi = partition(array: &self, low: low, high: high)
            quickSort(low: low, high: pi - 1)
            quickSort(low: pi + 1, high: high)
        }
    }
}
