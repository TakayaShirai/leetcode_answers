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
  func isBalanced(_ root: TreeNode?) -> Bool {
    return isBalancedWithHeight(root).isBalanced
  }

  private func isBalancedWithHeight(_ root: TreeNode?) -> (isBalanced: Bool, height: Int) {
    guard let root = root else { return (true, 0) }

    let leftSubtree = isBalancedWithHeight(root.left)
    let rightSubtree = isBalancedWithHeight(root.right)

    let isBalanced: Bool =
      (leftSubtree.isBalanced && rightSubtree.isBalanced)
      && abs(leftSubtree.height - rightSubtree.height) <= 1
    let height: Int = max(leftSubtree.height, rightSubtree.height) + 1

    return (isBalanced, height)
  }
}
