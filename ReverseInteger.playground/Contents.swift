import UIKit

/**
 [Link](https://leetcode.com/problems/reverse-integer/)
 Given a 32-bit signed integer, reverse digits of an integer.

 Example 1:

 Input: 123
 Output: 321
 Example 2:

 Input: -123
 Output: -321
 Example 3:

 Input: 120
 Output: 21

 Note:
 Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
 */
class Solution {
    func reverse(_ x: Int) -> Int {
        var reversed = 0
        var num = x
        print("In32.max:\(Int32.max), Int32.min:\(Int32.min)")
        // iterate through each digit
        while num != 0 {
            let digit = num % 10
            num = num / 10
            if ((reversed > Int32.max / 10) || (reversed == Int32.max / 10 && digit > 7)) {
                return 0
            }
            if ((reversed < Int32.min / 10) || (reversed == Int32.min / 10 && digit < -8)) {
                return 0
            }
            reversed = reversed * 10 + digit
        }
        return reversed
    }
}
let solution = Solution()
print("reversed: ", solution.reverse(-2147483648))
