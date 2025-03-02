/// Definition for a binary tree node.
/// public class TreeNode {
///     public var val: Int
///     public var left: TreeNode?
///     public var right: TreeNode?
///     public init() { self.val = 0; self.left = nil; self.right = nil; }
///     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
///     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
///         self.val = val
///         self.left = left
///         self.right = right
///     }
/// }
class Solution {
  func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
    var curSum: Int = 0
    inorderDfs(node: root, low: low, high: high, curSum: &curSum)
    return curSum
  }

  private func inorderDfs(node: TreeNode?, low: Int, high: Int, curSum: inout Int) {
    guard let node = node else { return }

    inorderDfs(node: node.left, low: low, high: high, curSum: &curSum)

    if low <= node.val && node.val <= high {
      curSum += node.val
    }

    inorderDfs(node: node.right, low: low, high: high, curSum: &curSum)
  }
}
