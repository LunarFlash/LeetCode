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
        var str = Array(s)
        var longest = String(str[0])
        var curr = 0
        while curr < str.count {
            if  curr - 1 >= 0, curr + 1 < str.count, str[curr - 1] == str[curr + 1] {
                let solution = expand(str: &str, left: curr - 1, right: curr + 1)
                if solution.count > longest.count {
                    longest = solution
                }
            }
            if curr + 1 < str.count, str[curr] == str[curr + 1] { //  found 2 char even palindrome such as "aa"
                let solution = expand(str: &str, left: curr, right: curr + 1)
                if solution.count > longest.count {
                    longest = solution
                }
            }
            curr += 1
        }
        return longest
    }
    private func expand(str: inout [Character], left: Int, right: Int) -> String {
        var steps = 0
        while left - (steps + 1) >= 0, right + (steps + 1) < str.count, str[left - (steps + 1)] == str[right + (steps + 1)] {
            steps += 1
        }
        return String(str[(left - steps)...(right + steps)])
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
