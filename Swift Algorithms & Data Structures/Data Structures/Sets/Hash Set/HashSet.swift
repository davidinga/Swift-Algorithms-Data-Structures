//
//  HashSet.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 5/29/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

struct HashSet<Element: Hashable> {
    private var set: HashTableOnlyKeys<Element>
    
    var isEmpty: Bool {
        return set.isEmpty
    }
    
    var count: Int {
        return set.count
    }
    
    init(size: Int) {
        set = HashTableOnlyKeys<Element>(size: size)
    }
    
    @discardableResult mutating func insert(_ element: Element) -> Bool {
        if(set.contains(element) == nil) {
            set.append(element)
            return true
        }
        return false
    }
    
    @discardableResult mutating func remove(_ element: Element) -> Element? {
        return set.remove(element)
    }
    
    mutating func removeAll() {
        set.removeAll()
    }
    
    func contains(_ element: Element) -> Element? {
        return set.contains(element)
    }
    
    func union(_ hashSet: HashSet<Element>) -> HashSet<Element> {
        var union = HashSet<Element>(size: self.set.size + hashSet.set.size)
        
        for element in self.set {
            union.insert(element)
        }

        for element in hashSet.set {
            union.insert(element)
        }
        
        return union
    }
    
    func intersection(_ hashSet: HashSet<Element>) -> HashSet<Element> {
        var newSet = HashSet<Element>(size: self.set.size + hashSet.set.size)
        
        for element in hashSet.set {
            if self.set.contains(element) != nil {
                newSet.insert(element)
            }
        }
        
        return newSet
    }
    
    func difference(_ hashSet: HashSet<Element>) -> HashSet<Element> {
        var newSet = HashSet<Element>(size: self.set.size + hashSet.set.size)
        
        for element in self.set {
            if hashSet.set.contains(element) == nil {
                newSet.insert(element)
            }
        }
        return newSet
    }
    
}

extension HashSet {
    var description: String {
        return set.description
    }
    var debugDescription: String {
        return set.debugDescription
    }
}
