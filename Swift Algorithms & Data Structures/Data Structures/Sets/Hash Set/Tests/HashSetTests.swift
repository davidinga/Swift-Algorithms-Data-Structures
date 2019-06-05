//
//  HashSetTests.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 6/5/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

class HashSetTests {
    init() {
        print("Testing Hash Set...")
        print("Insert 1,2,3,4,5 into var set.")
        var set = HashSet<Int>(size: 5)
        set.insert(1)
        set.insert(2)
        set.insert(3)
        set.insert(4)
        set.insert(5)
        print(set.debugDescription)
        
        print("Insert 1,10, 100 into var set2.")
        var set2 = HashSet<Int>(size: 3)
        set2.insert(1)
        set2.insert(10)
        set2.insert(100)
        print(set2.debugDescription)
        
        print("Union of set and set2.")
        let newSet = set.union(set2)
        print(newSet.debugDescription)
        
        print("Intersection of set and set2.")
        let newSet2 = set.intersection(set2)
        print(newSet2.debugDescription)
        
        print("Difference of set and set2. set - set2.")
        let newSet3 = set.difference(set2)
        print(newSet3.debugDescription)
        
        print()
    }
}
