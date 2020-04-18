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

    init(value: T) {
        self.value = value
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

extension BinarySearchTree {
    public func insert(value: T) {
        if value < self.value {
            if let left = left {
                left.insert(value: value)
            } else {
                left = BinarySearchTree(value: value)
                left?.parent = self

            }
        } else {
            if let right = right {
                right.insert(value: value)
            } else {
                right = BinarySearchTree(value: value)
                right?.parent = self
            }
        }
    }

}



