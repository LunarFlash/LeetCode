import UIKit

class Node<T: Equatable>: Equatable {
    var value: T
    var next: Node<T>? = nil
    var prev: Node<T>? = nil

    init(value: T) {
        self.value = value
    }

    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.value == rhs.value
    }
}

class DoublyLinkedList<T: Equatable> {
    var head: Node<T>? = nil
    var tail: Node<T>? = nil
    var size: Int = 0

    func append(_ value: T) {
        // 1
        let newNode = Node(value: value)

        // 2
        guard self.head != nil else {
            // 3
            self.head = newNode
            self.tail = newNode
            self.size += 1
            return
        }

        // 4
        self.tail?.next = newNode
        newNode.prev = self.tail
        self.tail = newNode

        // 5
        self.size += 1
    }

    func prepend(value: T) {
        // 1
        let newNode = Node(value: value)

        // 2
        guard self.head != nil else {
            // 3
            self.head = newNode
            self.tail = newNode
            self.size += 1
            return
        }

        // 4
        self.head?.prev = newNode
        newNode.next = self.head
        self.head = newNode

        // 5
        self.size += 1
    }

    func reverse() {
        var curr = head
        while curr != nil {
            let temp = curr?.prev
            curr?.next?.prev = curr
            curr?.prev = curr?.next
            curr?.next = temp
            curr = curr?.prev
        }
        let tempTail = tail
        tail = head
        head = tempTail
    }
}

extension DoublyLinkedList: CustomStringConvertible {
    var description: String {
        var str = ""
        var curr = head
        while curr != nil {
            str += "\(curr!.value)"
            if curr?.next != nil {
                str += "<->"
            }
            curr = curr?.next
        }
        return str + ""
    }
}

let linkedList = DoublyLinkedList<Int>()
linkedList.append(1)
linkedList.append(2)
linkedList.append(3)
linkedList.append(4)
linkedList.append(5)
print(linkedList)
linkedList.reverseRecursive(curr: linkedList.head)
print(linkedList)
