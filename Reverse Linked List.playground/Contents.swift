import UIKit

/**
 [Reverse a singly linked list.](https://leetcode.com/problems/reverse-linked-list/)

 Example:

 Input: 1->2->3->4->5->NULL
 Output: 5->4->3->2->1->NULL
 Follow up:

 A linked list can be reversed either iteratively or recursively. Could you implement both?
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    // Recurisve
    func reverseList(_ head: ListNode?) -> ListNode? {
        var curr = head
        // exist condition
        if curr == nil {
            return head
        } else if curr?.next == nil {  // this should be the new head

        } else {

        }
    }

    // Iterative
}

let node1 = ListNode(1)
let head = node1
let node2 = ListNode(2)
node1.next = node2
let node3 = ListNode(3)
node2.next = node3
let node4 = ListNode(4)
node3.next = node4
let node5 = ListNode(5)
node4.next = node5

let solution = Solution()
solution.reverseList(head)
