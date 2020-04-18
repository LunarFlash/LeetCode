import UIKit

/**
 (Binary Tree)[https://www.raywenderlich.com/990-swift-algorithm-club-swift-binary-search-tree-data-structure]
 */

class Node<T> {

    var value: T

    var left: Node?
    var right: Node?

    init(value: T) {
        self.value = value
    }
}

enum BinaryTree<T> {
    case empty
    indirect case node(BinaryTree, T, BinaryTree)
}

extension BinaryTree: CustomStringConvertible {
    var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
        case.empty:
            return ""
        }
    }

    var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
}

// leaf nodes
let node5 = BinaryTree.node(.empty, "5", .empty)
let nodeA = BinaryTree.node(.empty, "a", .empty)
let node10 = BinaryTree.node(.empty, "10", .empty)
let node4 = BinaryTree.node(.empty, "4", .empty)
let node3 = BinaryTree.node(.empty, "3", .empty)
let nodeB = BinaryTree.node(.empty, "b", .empty)

// intermediate nodes on the left
let Aminus10 = BinaryTree.node(nodeA, "-", node10)
let timeLeft = BinaryTree.node(node5, "*", Aminus10)

// intermediate nodes on the right
let minus4 = BinaryTree.node(.empty, "-", node4)
let divide3AndB = BinaryTree.node(node3, "/", nodeB)
let timesRight = BinaryTree.node(minus4, "*", divide3AndB)

let tree = BinaryTree.node(timeLeft, "+", timesRight)

print(tree)
tree.count





