/**
 [BST](https://github.com/raywenderlich/swift-algorithm-club/tree/master/Binary%20Search%20Tree)
 Insertion - O(h)
 Search - O(h)
Traversal of all nodes:
 1. In-order - depth-first: First look at left child of a node, then at the node itself, then right child
 2. Pre-order - first look at a node then its left and right children
 3. Post-order - first look at left child, then right child, then node itself.
Deletion:
Remove if childless, otherwise replace with its biggest child on the left or smallest chld on the right.
 */

import UIKit

var str = "Hello, playground"

public class BinarySearchTree<T: Comparable> {
    private(set) public var value: T
    private(set) public var parent: BinarySearchTree?
    private(set) public var right: BinarySearchTree?
    private(set) public var left: BinarySearchTree?

    public init(value: T) {
        self.value = value
    }

    public convenience init(array: [T]) {
        precondition(array.count > 0)
        self.init(value: array.first!)
        for v in array.dropFirst() {
            insert(v)
        }
    }

    public var isRoot: Bool {
        return parent == nil
    }

    public var isLeaf: Bool {
        return left == nil && right == nil
    }

    public var isLeftChild: Bool {
        return parent?.left === self
    }

    public var isRightChild: Bool {
        return parent?.right === self
    }

    public var hasLeftChild: Bool {
        return left != nil
    }

    public var hasRightChild: Bool {
        return right != nil
    }

    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }

    public var hasBothChildren: Bool {
        return hasLeftChild && hasRightChild
    }

    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
}

public extension BinarySearchTree {
    func insert(_ value: T) {
        if value < self.value {
            if let left = left {
                left.insert(value)
            } else {
                left = BinarySearchTree(value: value)
                left?.parent = self

            }
        } else {
            if let right = right {
                right.insert(value)
            } else {
                right = BinarySearchTree(value: value)
                right?.parent = self
            }
        }
    }

    func search(_ value: T) -> BinarySearchTree? {
        if value < self.value {
            return left?.search(value)
        } else if value > self.value {
            return right?.search(value)
        } else {
            return self
        }
    }
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = right {
            s += " -> (\(right.description)"
        }
        return s
    }
}

let tree = BinarySearchTree<Int>(array: [7, 2, 5, 10, 9, 1])

tree.search(6)
tree.search(10)


