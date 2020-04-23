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
        let str = Array(s)
        var longest = String(str[0])
        var curr = 0
        while curr < str.count {
            // iterate on i until we reach a valid palindrome (aa or aba), then expand and store. then jump to the last character on the right and keep going
            //print("curr: \(str[curr]) at index: \(curr)")
            let palindromeFound = expandAround(curr: &curr, str: str) // at min this will be a pathetic 1 char palindrome
            if palindromeFound.count > longest.count {
                longest = palindromeFound
            }
        }
        //print("longest: \(longest)")
        return longest
    }

    private func expandAround(curr: inout Int, str: [Character]) -> String {
        // Identify if this is a palindrome, and if its and odd (aba) or even (aa) palindrome

        // set pivotes
        var palindrome = String(str[curr])
        var left = curr
        var right = curr
        if  curr - 1 >= 0 && curr + 1 < str.count && str[left - 1] == str[left + 1] { // found 3 char odd going left and right, such as "bab"
            //print("condition <-xyx")
            right = curr + 1
            left = curr - 1
            palindrome = String(str[left]) + palindrome + String(str[right])


        } else if (curr + 1) < str.count, str[curr] == str[curr + 1] { //  found 2 char even palindrome such as "aa"
            print("condition: xx")
            right = curr + 1
            palindrome = palindrome + String(str[left + 1])
        } else if (left + 2) < str.count, str[left + 2] == str[left] { // found 3 char odd palindrome as as "aba"
            //print("condition: xyx->")
            right = curr + 2
            palindrome = palindrome + String([str[left + 1], str[left + 2]])
        } else { // just a 1 character palindrome, nothing special
            curr += 1
            return palindrome
        }
        //print("after pointers are set, left: \(left) right: \(right)")
        // Pivotes are set! :D We found a multi char palindrome at this point so we can start expanding
        // while we are not hitting the string's bounds && we are expanding into a valid palindrome
        while left - 1 >= 0, right + 1 < str.count, str[left - 1] == str[right + 1] {
            left -= 1
            right += 1
            palindrome = String(str[left]) + palindrome + String(str[right])
        }
        // left and right are pointing at the edges of a palindrome!
        // we can jump curr to right, because we have already processed all the characters up to right.
        curr = right
        print("current palindrome: \(palindrome) left: \(left) right: \(right)")
        return palindrome
    }
}

let solution = Solution()
//solution.longestPalindrome("babab")
solution.longestPalindrome("aaaa")
//solution.longestPalindrome("bazzadazz")
//solution.longestPalindrome("bdYdTada")
