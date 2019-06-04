//
//  HashTableTests.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 5/31/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

class HashTableTests {
    init() {
        print("Testing Hash Table...")
        var movies = HashTable<String, String>(size: 15)
        
        movies["tt0111161"] = "The Shawshank Redemption"
        movies["tt0068646"] = "The Godfather (1972)"
        movies["tt0071562"] = "The Godfather: Part II (1974)"
        movies["tt0468569"] = "The Dark Knight (2008)"
        movies["tt0050083"] = "12 Angry Men (1957)"
        movies["tt0108052"] = "Schindler's List (1993)"
        movies["tt0167260"] = "The Lord of the Rings: The Return of the King (2003)"
        
        print("Adding movie titles to the Hash Table.")
        movies.isEmpty ? print("The Hash Table is empty.") : print("The Hash Table is not empty.")
        
        print()
        print("Hash Table:")
        print()
        print(movies.debugDescription)
        print()
        
        print("There are \(movies.count) elements in the Hash Table.")
        print("The IMDB key tt0167260 returns \"\(movies.value(forKey: "tt0167260") ?? "nothing")\" from the Hash Table.")
        print("tt0111161: \"The Shawshank Redemption\" is missing year. Updating with year. ")
        movies.updateValue("The Shawshank Redemption (1994)", forKey: "tt0111161")
        print("tt0111161: \"\(movies.value(forKey: "tt0111161")!)\"")
        print("Let's remove \"\(movies.value(forKey: "tt0050083")!)\" because it is old.")
        
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
