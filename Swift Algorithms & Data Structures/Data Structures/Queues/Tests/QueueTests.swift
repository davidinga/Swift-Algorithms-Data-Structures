//
//  QueueTests.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 5/29/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

class QueueTests {
    
    init() {
        print("Testing Queue...")
        var queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        queue.enqueue(4)
        queue.enqueue(5)
        
        print("Enqueue: 1, 2, 3, 4, 5")
        print("The number of elements in the Queue is: \(queue.count)")
        queue.isEmpty ? print("The Queue is empty.") : print("The Queue contains elements.")
        print("The first element in the Queue is: \(queue.peek()!.element).")
        print("Enqueue...")
        queue.enqueue(7)
        print("Enqued: 7 to the end of Queue.")
        print("Dequeue...")
        print("Removed \(queue.dequeue()!.element) from the Queue.")
        print()
    }
}
