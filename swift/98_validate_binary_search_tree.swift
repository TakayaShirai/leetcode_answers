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
  func isValidBST(_ root: TreeNode?) -> Bool {
    return dfs(root, Int.min, Int.max)
  }

  private func dfs(_ node: TreeNode?, _ leftBoundary: Int, _ rightBoundary: Int) -> Bool {
    guard let node = node else { return true }

    if !(leftBoundary < node.val && node.val < rightBoundary) {
      return false
    }

    return dfs(node.left, leftBoundary, node.val) && dfs(node.right, node.val, rightBoundary)
  }
}
