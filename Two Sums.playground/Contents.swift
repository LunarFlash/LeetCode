import UIKit
/**
 [Two Sum](https://leetcode.com/problems/two-sum/)
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 Example:

 Given nums = [2, 7, 11, 15], target = 9,

 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 Accepted
 */
class Solution {
    //[2,7,11,15]
    //9
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dictionary = [Int: Int]()
        for i in 0..<nums.count {
            let current = nums[i]
            let complement = target - current
            if let firstIndex = dictionary[complement], firstIndex != i {
                print("found answer: [\(firstIndex),\(i)]")
                return [firstIndex, i]
            }
            dictionary[nums[i]] = i
        }
        return [Int]()
    }
}

let solution = Solution()
solution.twoSum([3,3], 6)


