import UIKit

/**
 [Recursion](https://medium.com/@daniel.oliver.king/getting-started-with-recursion-f89f57c5b60e)
 Break the problem I am trying to solve down into a problem that is one step simpler
 Assume that my function will work to solve the simpler problem — really believe it beyond any doubt
 Ask myself: Since I know I can solve the simpler problem, how would I solve the more complex problem?
 */

class Solution {

    func reverse(_ string: String) -> String {
        if string.count < 2 {
            return string
        }
        return reverse(String(string.dropFirst())) + String(string.first!)
    }

    func printArray(array: [String]) {
        if array.count == 0 { return }
        print(array.first!)
        return printArray(array: Array(array.dropFirst()))
    }

    func isPalindrome(_ string: String) -> Bool {
        if string.count <= 1 {
            return true
        }
        if string.first == string.last {
            return isPalindrome(String(string.dropFirst().dropLast()))
        } else {
            return false
        }
    }

    /// A to the power of B
    func exponent(a: Int, b: Int) -> Int {
        if a == 0 || a == 1 {
            return a
        }
        if b == 0 {
            return 1
        }
        return a * (exponent(a: a, b: b - 1))
    }
}

let s = Solution()
s.reverse("abc")
s.printArray(array: ["A", "B", "C"])
s.isPalindrome("lyiyl")
s.exponent(a: 2, b: 5)
