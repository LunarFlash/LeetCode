/**
 [Longest Palindromic Substring](https://leetcode.com/problems/longest-palindromic-substring/)
 Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

 Example 1:

 Input: "babad"
 Output: "bab"
 Note: "aba" is also a valid answer.
 Example 2:

 Input: "cbbd"
 Output: "bb"
 */
import UIKit

class Solution {
    func longestPalindrome(_ s: String) -> String {
        if s.count <= 1 { return s }
        let str = Array(s)
        var longestStart: Int = 0
        var longestLength: Int = 0

        for i in 0..<str.count - 1 {
            if  i - 1 >= 0, i + 1 < str.count, str[i - 1] == str[i + 1] { // odd
                expand(str: str, left: i - 1, right: i + 1, start: &longestStart, longestLength: &longestLength)
            }
            if i + 1 < str.count, str[i] == str[i + 1] { // even
                expand(str: str, left: i, right: i + 1, start: &longestStart, longestLength: &longestLength)
            }
        }
        return String(str[longestStart...(longestStart + longestLength)])
    }
    private func expand(str: [Character], left: Int, right: Int, start: inout Int, longestLength: inout Int) {
        var steps = 0
        while left - (steps + 1) >= 0, right + (steps + 1) < str.count, str[left - (steps + 1)] == str[right + (steps + 1)] {
            steps += 1
        }
        let currentLength = (right + steps) - (left - steps)
        if currentLength > longestLength {
            start = left - steps
            longestLength = currentLength
        }
    }
}

let solution = Solution()
solution.longestPalindrome("babab")
solution.longestPalindrome("aaaa")
solution.longestPalindrome("bazzadazz")
solution.longestPalindrome("bdYdTada")
print("done")





extension Solution {
    private func expandRecursively(str: inout [Character], left: Int, right: Int) -> String {
        // base condition
        if left - 1 < 0 || right + 1 >= str.count || str[left - 1] != str[right + 1] {
            return String(str[left...right])
        }
        return expandRecursively(str: &str, left: left - 1, right: right + 1)
    }
}
