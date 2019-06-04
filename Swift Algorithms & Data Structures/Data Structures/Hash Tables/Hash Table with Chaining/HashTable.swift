//
//  HashTable.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 5/30/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

struct HashTable<Key: Hashable, Value> {
    private typealias Element = (key: Key, value: Value)
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
    
    subscript(key: Key) -> Value? {
        get {
            return value(forKey: key)
        }
        set {
            if let value = newValue {
                updateValue(value, forKey: key)
            } else {
                removeValue(forKey: key)
            }
        }
    }
    
    func value(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        var node = table[index].first
        
        while node != nil {
            if node!.element.key == key {
                return node!.element.value
            }
            node = node!.next
        }
        
        return nil
    }
    
    @discardableResult mutating func updateValue(_ value: Value, forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        var node = table[index].first
        
        while node != nil {
            if node!.element.key == key {
                let oldValue = node!.element.value
                node!.element.value = value
                return oldValue
            }
            node = node!.next
        }
        
        table[index].append((key: key, value: value))
        count += 1
        return nil
    }
    
    @discardableResult mutating func removeValue(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        var node = table[index].first
        
        while node != nil {
            if node!.element.key == key {
                count -= 1
                return table[index].remove(node: node!)!.element.value
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

extension HashTable: CustomStringConvertible {
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
        let pairs = newTable.flatMap() { b in b.map { e in "\(e.key) = \(e.value)" } }
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
            let pairs = list.map { e in "\(e.key) = \(e.value)" }
            str += "list \(i): " + pairs.joined(separator: ", ") + "\n"
        }
        return str
    }
}
