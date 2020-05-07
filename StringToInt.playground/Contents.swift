import UIKit

class Solution {
    func myAtoi(_ str: String) -> Int {
        let validChars: [Character] = ["0","1","2","3","4","5","6","7","8","9"]
        let s = Array(str)
        var i = 0
        var numStr = ""
        var isNegative = false
        // get rid of white space until we dont have any more or hit a + / - sign
        while i < s.count, s[i] == " " {
            i += 1
        }
        if i < s.count, s[i] == "+" || s[i] == "-" {
            if s[i] == "-" {
                isNegative = true
            }
            i += 1
        }
        // trim any zeros
        while i < s.count, s[i] == "0" {
            i += 1
        }

        // parse the number
        while i < s.count {
            if validChars.contains(s[i]) {
                numStr.append(String(s[i]))
                i += 1
            } else {
                break
            }
        }

        // check if out of Int32 bounds
        guard numStr.count <= 10 else {
            return isNegative ? Int(Int32.min) : Int(Int32.max)
        }

        if var num = Int(numStr) {
          if isNegative { num = -1 * num }

          if num > Int32.max {
              return Int(Int32.max)
          } else if num < Int32.min {
              return Int(Int32.min)
          } else {
              return num
          }
        }
        return 0
    }
}

let s = Solution()
print(s.myAtoi("20000000000000000000"))
print(s.myAtoi("   -42"))
print(s.myAtoi("words and 987"))
print(s.myAtoi("+-2"))
print(s.myAtoi("  0000000000012345678"))
print(s.myAtoi("     +004500"))

