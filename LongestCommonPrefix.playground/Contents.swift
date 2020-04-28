/**
 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".

 Example 1:

 Input: ["flower","flow","flight"]
 Output: "fl"
 Example 2:

 Input: ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.
 Note:

 All given inputs are in lowercase letters a-z.
 */
import UIKit

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard let first = strs.first else { return "" }
        for (i, char) in first.enumerated() {
            for str in strs {
                if  i >= str.count || char != Array(str)[i] {
                    return String(first.prefix(i))
                }
            }
        }
        return first
    }
}

let s = Solution()
s.longestCommonPrefix(["flower","flow","flight"])
s.longestCommonPrefix(["dog","racecar","car"])
s.longestCommonPrefix(["aa","a"])
