//
//  SimpleHashTable.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 8/26/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

struct SimpleHashTable<Key: Hashable, Value> {
    private typealias Element = (key: Key, value: Value)
    private typealias List = SimpleLinkedList<Element>
    
    private var table: [List]
    
    init(size: Int) {
        table = Array<List>()
        
        for _ in 0..<size {
            let list = List()
            table += [list]
        }
    }
    
    func value(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        var node = table[index].head
        
        while node != nil {
            if node!.data.key == key {
                return node!.data.value
            }
            node = node!.next
        }
        
        return nil
    }
    
    mutating func append(_ value: Value, forKey key: Key) {
        let index = self.index(forKey: key)
        table[index].append((key: key, value: value))
    }
    
    func index(forKey key: Key) -> Int {
        return abs(key.hashValue % table.count)
    }
}
