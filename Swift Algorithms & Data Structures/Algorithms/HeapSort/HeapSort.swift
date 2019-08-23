//
//  HeapSort.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 8/22/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

//// HeapSort implementation with Heap<Element>.
func heapSort<Element>(array: inout [Element]) where Element: Comparable {
    var heap = Heap(elements: array, priorityFunction: <)
    var i = 0
    while heap.count > 0 {
        if let value = heap.extract() {
            array[i] = value
        }
        i += 1
    }
}

//// Stand-alone HeapSort implementation.
private func heapify<Element>(_ array: inout [Element], _ count: Int, _ index: Int) where Element: Comparable {
    var largest = index
    let l = 2 * index + 1
    let r = 2 * index + 2
    
    //// Check if left child exists and is greater than parent.
    if l < count && array[index] < array[l] {
        largest = l
    }
    
    //// Check if right child exists and greater than parent.
    if r < count && array[largest] < array[r] {
        largest = r
    }
    
    //// Swap child with parent if child is larger.
    if largest != index {
        array.swapAt(index, largest)
        heapify(&array, count, largest)
    }
}

func heapSort<Element>(_ array: inout [Element]) where Element: Comparable {
    let count = array.count
    
    //// Build MaxHeap.
    for i in stride(from: count, to: -1, by: -1) {
        heapify(&array, count, i)
    }
    
    //// Extract the largest element from MaxHeap
    //// - Largest element swaped with last element in MaxHeap.
    //// - Size of MaxHeap decreases by 1 on each pass.
    //// - Heapify called to restore MaxHeap properties.
    for i in stride(from: count - 1, to: 0, by: -1) {
        array.swapAt(i, 0)
        heapify(&array, i, 0)
    }
}
