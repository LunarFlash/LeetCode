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

func printList(head: ListNode?) {
    let curr = head
    if curr == nil {
        return
    } else {
        print("\(curr!.val)")
        printList(head: curr?.next)
    }
}

class Solution {
    // Iterative
    func reverseList(_ head: ListNode?) -> ListNode? {
        var newHead: ListNode? = head
        while let next = head?.next {
            head?.next = next.next
            next.next = newHead
            newHead = next
        }
        head?.next = nil
        return newHead
    }

}

/// Setup test
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
let newHead = solution.reverseList(head)
printList(head: newHead)


