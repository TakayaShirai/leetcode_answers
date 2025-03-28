/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

class BSTIterator {
  private var nodesStack: [TreeNode]

  init(_ root: TreeNode?) {
    self.nodesStack = []
    pushLeftBranch(of: root)
  }

  func hasNext() -> Bool {
    return !nodesStack.isEmpty
  }

  func next() -> Int {
    guard hasNext() else { fatalError("No more elements in BSTIterator.") }

    let nextNode = nodesStack.removeLast()
    pushLeftBranch(of: nextNode.right)

    return nextNode.val
  }

  private func pushLeftBranch(of node: TreeNode?) {
    var curNode = node
    while let node = curNode {
      nodesStack.append(node)
      curNode = node.left
    }
  }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
