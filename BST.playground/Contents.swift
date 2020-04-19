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
    
    func traverseInOrder(process: (T) -> Void) {
        left?.traverseInOrder(process: process)
        process(value)
        right?.traverseInOrder(process: process)
    }
    
    func traversePreOrder(process: (T) -> Void) {
        process(value)
        left?.traversePreOrder(process: process)
        right?.traversePreOrder(process: process)
    }
    
    func traversePostOrder(process: (T) -> Void) {
        left?.traversePostOrder(process: process)
        right?.traversePostOrder(process: process)
        process(value)
    }
    
    func map(formula:(T) -> T) -> [T] {
        var a = [T]()
        if let left = left {
            a += left.map(formula: formula)
        }
        a.append(formula(value))
        if let right = right {
            a += right.map(formula: formula)
        }
        return a
    }
    
    func toArray() -> [T] {
        map { $0 }
    }
    
    func minimum() -> BinarySearchTree? {
        var node = self
        while let next = node.left {
            node = next
        }
        return node
    }
    
    func maximum() -> BinarySearchTree? {
        var node = self
        while let next = node.right {
            node = next
        }
        return node
    }
    
    @discardableResult
    func remove() -> BinarySearchTree? {
        let replacement: BinarySearchTree?
        // Replacement for current node can be either biggest one on the left or
        // smallest one on the right, whichever is not nil
        if let left = left {
            replacement = left.maximum()
        } else if let right = right {
            replacement = right.minimum()
        } else {
            replacement = nil
        }
        replacement?.remove()
        
        // Place the replacement on current node's position
        replacement?.right = right
        replacement?.left = left
        right?.parent = replacement
        left?.parent = replacement
        reconnectParentTo(node:replacement)
        // The current node is no longer part of the tree, so clean it up.
        parent = nil
        left = nil
        right = nil

        return replacement
    }
    
    func height() -> Int {
      if isLeaf {
        return 0
      } else {
        return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
      }
    }
    
    /// Distance to the root
    func depth() -> Int {
      var node = self
      var edges = 0
      while let parent = node.parent {
        node = parent
        edges += 1
      }
      return edges
    }
    
    func isBST(minValue: T, maxValue: T) -> Bool {
      if value < minValue || value > maxValue { return false }
      let leftBST = left?.isBST(minValue: minValue, maxValue: value) ?? true
      let rightBST = right?.isBST(minValue: value, maxValue: maxValue) ?? true
      return leftBST && rightBST
    }
}

extension BinarySearchTree {
    /// Takes the parent of the current node -- that is self -- and connects it to another node which will be one of the children of self.
    private func reconnectParentTo(node: BinarySearchTree?) {
        guard let parent = parent else { return }
        if isLeftChild {
            parent.left = node
        } else {
            parent.right = node
        }
        node?.parent = parent
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

print("pre order")
tree.traversePreOrder { (value) in print(value) }
print("in order")
tree.traverseInOrder { (value) in print(value) }
print("post order")
tree.traversePostOrder { (value) in print(value) }
tree.toArray()
