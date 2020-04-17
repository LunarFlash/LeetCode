import UIKit

/**
 [Reverse a singly linked list.](https://leetcode.com/problems/reverse-linked-list/)
 [Youtube explaination](https://youtu.be/O0By4Zq0OFc?t=583)

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

func description (head: ListNode?, str: String = "") -> String? {
    if head == nil {
        return str
    } else {
        return description(head: head?.next, str: str + "\(head!.val)" + "->")
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
        return newHead
    }

    func reverseListRecursive(_ head: ListNode?) -> ListNode? {
        // exit conditions
        if head == nil || head?.next == nil {
            return head
        }
        // walk backwards from exit condition, assuming the list head is processed
        let reversedListHead = reverseListRecursive(head?.next)
        print("current head:\(head!.val) revsersedLst:\(description(head: reversedListHead))")
        head?.next?.next = head
        head?.next = nil
        print("reversed list head: \(reversedListHead?.val)")
        return reversedListHead
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
let newHead = solution.reverseListRecursive(head)
print("result: \(description(head: newHead))")


