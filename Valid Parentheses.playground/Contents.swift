/**
 https://leetcode.com/problems/valid-parentheses/
 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Note that an empty string is also considered valid.

 Example 1:

 Input: "()"
 Output: true
 Example 2:

 Input: "()[]{}"
 Output: true
 Example 3:

 Input: "(]"
 Output: false
 Example 4:

 Input: "([)]"
 Output: false
 Example 5:

 Input: "{[]}"
 Output: true
 */

import UIKit

struct Stack<Element> {
    private var array: [Element] = []

    mutating func push(_ element: Element) {
        array.append(element)
    }
    @discardableResult
    mutating func pop(_ element: Element) -> Element? {
        return array.popLast()
    }
    @discardableResult
    mutating func peek() -> Element? {
        return array.last
    }

    var isEmpty: Bool {
        return array.isEmpty
    }

    var count: Int {
        return array.count
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        let topDivider = "---Stack---\n"
        let bottomDivider = "\n---------\n"
        let stackElements = array.map{ "\($0)" }.reversed().joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}

class Solution {
    func isValid(_ s: String) -> Bool {
        if s.count % 2 != 0 || s.first == "]" || s.first ==  ")" || s.first == "}" { return false }
        if s.count == 0 { return true }
        var array = Array(s)
        //print("string:", s)
        // process string try to find match
        for (i, char) in array.enumerated() {
            guard i + 1 < array.count else { return false }
            let next = array[i + 1]
            if (char == "(" && next == ")") || (char == "[" && next == "]") || (char == "{" && next == "}") {
                //print("at i:\(i) matched \(char)\(next)")
                array.remove(at: i + 1)
                array.remove(at: i)
                return isValid(String(array))
            }
        }
        return false
    }
}

print(Solution().isValid("[()]")) // true
print(Solution().isValid("()[]{}")) // true
print(Solution().isValid("()[]{}()")) // true
print(Solution().isValid("(({})[]{}())")) // true
print(Solution().isValid("(]")) // false
print(Solution().isValid("{[]}")) // true
print(Solution().isValid("]"))
print(Solution().isValid("){"))
print(Solution().isValid("{}][}}{[))){}{}){(}]))})[({"))
