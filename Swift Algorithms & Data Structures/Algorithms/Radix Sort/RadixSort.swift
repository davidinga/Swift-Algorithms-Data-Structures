//
//  RadixSort.swift
//  Swift Algorithms & Data Structures
//
//  Created by David Inga on 8/7/19.
//  Copyright © 2019 David Inga. All rights reserved.
//

extension Array where Element == Int {
    mutating func radixSort() {
        let radix = 10
        var digit = 1
        var done = false
        var unsortedArray = self
        while !done {
            done = true
            /// Counting Sort: Step 1
            /// - Tally each number in count array.
            var countArray = Array<Int>(repeating: 0, count: radix)
            for number in unsortedArray {
                guard number >= 0 else {
                    return
                }
                let index = number / digit
                countArray[index % radix] += 1
                if index > 0 && done {
                    done = false
                }
            }
            /// Counting Sort: Step 2
            /// - Modify count array to apply proper indices.
            for i in 1..<radix {
                countArray[i] += countArray[i - 1]
            }
            /// Counting Sort: Step 3
            /// - Build sorted array from indices in count array.
            var sortedArray = Array<Int>(repeating: 0, count: unsortedArray.count)
            /// Iterate over elements in reverse for stable sort.
            for number in unsortedArray.reversed() {
                let index = (number / digit) % radix
                countArray[index] -= 1
                sortedArray[countArray[index]] = number
            }
            unsortedArray = sortedArray
            digit *= radix
        }
        self = unsortedArray
    }
}



























/*
 Radix Sort Logic
 
 Given an array of integers (unsortedArray), return an array with the integers sorted from least to greatest.
 
 1) Iterate through each digit. The number of iterations will be equal to the number of digits in the largest integer.
 2) Run a noncomparative subroutine algorithm like Counting Sort or Bubble Sort on unsortedArray. Note that we will be sorting by the current digit, and not by the entire number.
 3) For Counting Sort, we create an array (countArray) with space equal to the number of possible integers. We set the value of each index equal to 0. var countArray = Array<Int>(repeating: 0, count: 10). Since we are using base ten, that would be 0-9. We use this array to keep a tally or count of the number of times, each digit occurs in our array.
 3) a) We then need to loop through all the elements in unsortedArray, and add 1 to each index, 0-9, that matches the integer of 0-9 in our unsortedArray. Since the integers in our unsortedArray, can be bigger than 0-9, we must do some arithmatic to return the proper digit within each integer. In other words, we will be running Counting Sort on each digit from least significant, to most significant. The math to count the proper digit is: (number / digit) % 10
 3) b) Now we have our countArray properly tallied for each integer. The number of tallies should be equal to the number of integers in our unsortedArray. We will now loop through our countArray, to add up the tallies from left to right. We do this to get the proper order/position of each digit for the unsortedArray. At each index, we modify the value to the value at the current index, plus the value of the previous index. We start this loop at index 1. If we started at index 0, we would go out of bounds. for i in 1..<10 countArray[i] += countArray[i-1]
 3) c) Now we are ready to sort unsortedArray at the current digit. At this point we need to duplicate our unsortedArray. We cannot loop through the integers in unsortedArray, while modifying the elements. This is because our countArray and our unsortedArray are independent. If we were to modify the position of our integers in unsortedArray, our countArray would also need to be modified. So duplicate it is. Note: If we were to modify our original arrray (inout), we could copy our orignal array at the start of the function. And our copy would become unsortedArray. In this case, we are going to make a new array called sortedArray. var sortedArray = unsortedArray. We loop through unsortedArray. for number in unsortedArray. We must subtract 1 from each index we access in our countArray. This is because, there could be multiple integers of the same value. The next value, that is of the same intever, that comes up in our unsortedArray, will be placed at the index, 1 before the last index. countArray[(number/digit)%10] -= 1 sortedArray[countArray[(number/digit)%10] = number.
 4) Now we are done sorting at the current digit. It is time to set unsortedArray equal to sortedArray. unsortedArray = sortedArray. We also need to increment our digit to the next place. digit *= 10
 5) And finally we need to stop incrementing through the digits, once we have looped through the maximum number of digits from the greatest number in our unsortedArray. We can accomplish this by checking the mod of each integer in unsortedArray. var check = number/digit. If check < 1, then we can stop the function.
 
 */
