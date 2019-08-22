//
//  MergeSort.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 8/22/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

func mergeSort<Element>(array: inout [Element]) where Element: Comparable {
    if array.count > 1 {
        let mid = array.count / 2
        var L = Array(array[..<mid])
        var R = Array(array[mid...])
        
        mergeSort(array: &L)
        mergeSort(array: &R)
        
        var i = 0, j = 0, k = 0
        while i < L.count && j < R.count {
            if L[i] < R[j] {
                array[k] = L[i]
                i += 1
            } else {
                array[k] = R[j]
                j += 1
            }
            k += 1
        }
        while i < L.count {
            array[k] = L[i]
            i += 1
            k += 1
        }
        while j < R.count {
            array[k] = R[j]
            j += 1
            k += 1
        }
    }
}

