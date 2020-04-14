import UIKit

/**
 [Link](https://leetcode.com/problems/palindrome-number/)
 Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.

 Example 1:

 Input: 121
 Output: true
 Example 2:

 Input: -121
 Output: false
 Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
 Example 3:

 Input: 10
 Output: false
 Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
 Follow up:

 Coud you solve it without converting the integer to a string?
 */
class Solution {

    func isPalindrome1(_ x: Int) -> Bool {
        let array = Array(String(x))
        print(array)
        for (i, digit) in array.enumerated() {
            //print("index: \(i) digit: \(digit) index to check: \(array.count - 1 - i), value: \(array[array.count - 1 - i])")
            if digit != array[array.count - 1 - i] {
                return false
            }
        }
        return true
    }

    func isPalindrome(_ x: Int) -> Bool {
        var x = x
        // if x is 0 it is a palindrome
        guard x != 0 else { return true }
        // to be a palindrome: x must be positive, and x must not end in 0
        guard x > 0 && x % 10 != 0 else { return false }

        var reverted = 0
        while x > reverted {
            reverted = reverted * 10 + x % 10
            print("x: \(x) reverted: \(reverted)")
            if reverted == x || reverted == (x / 10) {
                return true
            }
            x = x / 10
        }
        return false
    }
}
let solution = Solution()
print("solution: ", solution.isPalindrome(2019229102))
print("solution: ", solution.isPalindrome(20192129102))
print("solution: ", solution.isPalindrome(1))
print("solution: ", solution.isPalindrome(10))
print("solution: ", solution.isPalindrome(0))
