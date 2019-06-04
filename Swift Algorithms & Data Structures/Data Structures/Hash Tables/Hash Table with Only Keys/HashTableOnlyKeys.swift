//
//  HashTableOnlyKeys.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 6/4/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

struct HashTableOnlyKeys<Key: Hashable> {
    private typealias Element = Key
    private typealias List = SinglyLinkedList<Element>
    
    private var table: [List]
    
    private(set) public var count = 0
    
    var isEmpty: Bool {
        return count == 0
    }
    
    init(size: Int) {
        assert(size > 0)
        table = Array<List>()
        
        //TODO: Init size of array with next closest prime number.
        for _ in 0..<size {
            let list = List()
            table += [list]
        }
    }
    
    func contains(_ key: Key) -> Key? {
        let index = self.index(forKey: key)
        var node = table[index].first
        
        while node != nil {
            if node!.element == key {
                return key
            }
            node = node!.next
        }
        
        return nil
    }
    
    mutating func append(_ key: Key) {
        let index = self.index(forKey: key)
        var node = table[index].first
        
        while node != nil {
            node = node!.next
        }
        
        table[index].append(key)
        count += 1
    }
    
    @discardableResult mutating func remove(_ key: Key) -> Key? {
        let index = self.index(forKey: key)
        var node = table[index].first
        
        while node != nil {
            if node!.element == key {
                count -= 1
                return table[index].remove(node: node!)!.element
            }
            node = node!.next
        }
        
        return nil
    }
    
    mutating func removeAll() {
        table = Array<List>(repeatElement(List(), count: table.count))
        count = 0
    }
    
    func index(forKey key: Key) -> Int {
        return abs(key.hashValue % table.count)
    }
}

extension HashTableOnlyKeys: CustomStringConvertible {
    /// A string that represents the contents of the hash table.
    public var description: String {
        // Building new data structure of [[Element]] to use map
        var newTable = Array<[Element]>(repeatElement([Element](), count: table.count))
        for (i, _) in table.enumerated() {
            var node = table[i].first
            while node != nil {
                newTable[i].append(node!.element)
                node = node!.next
            }
        }
        let pairs = newTable.flatMap() { b in b.map { e in "\(e)" } }
        return pairs.joined(separator: ", ")
    }
    
    /// A string that represents the contents of
    /// the hash table, suitable for debugging.
    public var debugDescription: String {
        // Building new data structure of [[Element]] to use map
        var newTable = Array<[Element]>(repeatElement([Element](), count: table.count))
        for (i, _) in table.enumerated() {
            var node = table[i].first
            while node != nil {
                newTable[i].append(node!.element)
                node = node!.next
            }
        }
        var str = ""
        for (i, list) in newTable.enumerated() {
            let pairs = list.map { e in "\(e)" }
            str += "list \(i): " + pairs.joined(separator: ", ") + "\n"
        }
        return str
    }
}
