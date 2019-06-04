//
//  HashTableOnlyKeysTests.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 6/4/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

class HashTableOnlyKeysTests {
    init() {
        print("Testing Hash Table with Only Keys...")
        var movies = HashTableOnlyKeys<String>(size: 15)
        
        movies.append("The Shawshank Redemption")
        movies.append("The Godfather (1972)")
        movies.append("The Godfather: Part II (1974)")
        movies.append("The Dark Knight (2008)")
        movies.append("12 Angry Men (1957)")
        movies.append("Schindler's List (1993)")
        movies.append("The Lord of the Rings: The Return of the King (2003)")
        
        print("Adding movie titles to the Hash Table.")
        movies.isEmpty ? print("The Hash Table is empty.") : print("The Hash Table is not empty.")
        
        print()
        print("Hash Table:")
        print()
        print(movies.debugDescription)
        print()
        
        print("There are \(movies.count) elements in the Hash Table.")
        print("Let's remove \"\(movies.remove("12 Angry Men (1957)")!)\" because it is old.")
        
        print("The Hash Table \(movies.contains("The Lord of the Rings: The Return of the King (2003)") != nil ? "contains" : "does not contain") \"The Lord of the Rings: The Return of the King (2003)\"")
        
        print()
        print("Hash Table:")
        print()
        print(movies.debugDescription)
        print()
        
        print("Let's empty the Hash Table.")
        movies.removeAll()
        
        print()
    }
}
