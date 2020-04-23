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
        //print("original string: \(s)")
        if s.count <= 1 { return s }
        var str = Array(s)
        var longest = String(str[0])
        var curr = 0
        while curr < str.count {
            // iterate on i until we reach a valid palindrome (aa or aba), then expand and store. then jump to the last character on the right and keep going
            //print("curr: \(str[curr]) at index: \(curr)")
            let palindromeFound = expandAround(curr: &curr, str: &str) // at min this will be a pathetic 1 char palindrome
            if palindromeFound.count > longest.count {
                longest = palindromeFound
            }
        }
        //print("longest: \(longest)")
        return longest
    }

    private func expandAround(curr: inout Int, str: inout [Character]) -> String {
        typealias Solution = (palindrome: String, right: Int)
        // Identify if this is a palindrome, and if its and odd (aba) or even (aa) palindrome

        // set pivotes
        var bestSolution: Solution = (palindrome: String(str[curr]), right: curr + 1)
        if  curr - 1 >= 0 && curr + 1 < str.count && str[curr - 1] == str[curr + 1] { // found 3 char odd going left and right, such as "bab"
            let solution = expandPalindrome(str: &str, left: curr - 1, right: curr + 1)
            if solution.palindrome.count > bestSolution.palindrome.count {
                bestSolution = solution
            }
        }
        if curr + 1 < str.count, str[curr] == str[curr + 1] { //  found 2 char even palindrome such as "aa"
            //print("condition: xx curr:\(curr)")
            let solution = expandPalindrome(str: &str, left: curr, right: curr + 1)
            if solution.palindrome.count > bestSolution.palindrome.count {
                bestSolution = solution
            }
        }
        //curr = bestSolution.right
        curr += 1
        return bestSolution.palindrome
    }

    private func expandPalindrome(str: inout [Character], left: Int, right: Int) -> (palindrome: String, right: Int) {
        var left = left
        var right = right
        while left - 1 >= 0, right + 1 < str.count, str[left - 1] == str[right + 1] {
            left -= 1
            right += 1
        }
        return (palindrome: String(str[left...right]), right: right)
    }
}

let solution = Solution()
//solution.longestPalindrome("babab")
solution.longestPalindrome("aaaa")
//solution.longestPalindrome("bazzadazz")
//solution.longestPalindrome("bdYdTada")
print("done")