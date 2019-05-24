//
//  main.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 5/24/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

// Test Singly Linked List

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node!.element)"
            node = node!.next
            if node != nil { text += ", " }
        }
        return text + "]"
    }
    
}

let dock = LinkedList<String>()
dock.append("Finder")
dock.append("Launchpad")
dock.append("Atom")
dock.append("GitHub Desktop")
dock.append("Coda 2")
dock.append("Xcode")
dock.append("Sublime Text")
dock.append("Adobe Photoshop CC 2019")
dock.append("Adobe Dreamweaver CC 2019")
dock.append("Adobe Illustrator CC 2019")
dock.append("Adobe InDesign CC 2019")
dock.append("Safari")
dock.append("Google Chrome")
dock.append("Mail")
dock.append("Calendar")
dock.append("Notes")
dock.append("Reminders")
dock.append("Messages")
dock.append("iTunes")
dock.append("App Store")
dock.append("System Preferences")

print("The LinkedList contains: \(dock.description)")
dock.isEmpty ? print("The LinkedList is empty.") : print("The LinkedList contains elements.")
print("The first element is: \(dock.first!.element).")
print("The last element is: \(dock.last!.element).")
print("Appending...")
dock.append("Trash")
print("Appended: \"\(dock.last!.element)\" to end of LinkedList.")
print("The element at index 11 is: \(dock.index(of: 11)!.element).")
_ = dock.remove(at: 11)
print("Removed element at index 11.")

print(dock.description)
