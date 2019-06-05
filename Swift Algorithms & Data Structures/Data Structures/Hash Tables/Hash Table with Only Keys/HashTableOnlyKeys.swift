//
//  HashTableOnlyKeys.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 6/4/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

struct HashTableOnlyKeys<Key: Hashable> {
    typealias Element = Key
    typealias List = SinglyLinkedList<Element>
    
    private var table: [List]
    
    private(set) public var count = 0
    
    public var size: Int {
        return table.count
    }
    
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

struct HashTableOnlyKeysIterator<Element: Hashable>: IteratorProtocol {
    private let table: HashTableOnlyKeys<Element>
    private var index = 0
    
    init(_ table: HashTableOnlyKeys<Element>) {
        self.table = table
    }
    
    mutating func next() -> Element? {
        let element = table.value(at: index)
        index += 1
        return element
    }
}

/// Extends Hash Table for Iteration
extension HashTableOnlyKeys: Sequence {
    
    // Gets the value at a given index
    func value(at index: Int) -> Element? {
        if index >= self.count { return nil }
        
        var count = 0
        var node: SinglyLinkedListNode<Element>?
        var element: Element?
        
        // Iterate through Hash Table's array
        loop: for tableIndex in 0..<table.count {
            node = table[tableIndex].first
            
            // Iterate through Linked List
            // Store element at given index
            while node != nil {
                element = node!.element
                if count == index {
                    break loop
                }
                node = node!.next
                count += 1
            }
        }
        return element
    }
    
    func makeIterator() -> HashTableOnlyKeysIterator<Element> {
        return HashTableOnlyKeysIterator(self)
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
