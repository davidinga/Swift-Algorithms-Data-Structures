//
//  BinarySearch.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 8/23/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

func binarySearch<Element>(for target: Element, in array: [Element]) -> Int? where Element: Comparable {
    var L = 0
    var R = array.count - 1
    var mid = 0
    
    while L <= R {
        //// Index of middle element.
        mid = L + (R - L) / 2
        
        //// Middle element is target; return it.
        if array[mid] == target {
            return mid
        }
        //// Middle element greater than target; ignore right.
        if array[mid] > target {
            R = mid - 1
        //// Middle element is less than target; ignore left.
        } else {
            L = mid + 1
        }
    }
    return nil
}
