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
  func isSymmetric(_ root: TreeNode?) -> Bool {
    guard let strongRoot = root else { return true }
    return isMirror(strongRoot.left, strongRoot.right)
  }

  private func isMirror(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
    guard !(left == nil && right == nil) else { return true }
    guard let strongLeft = left, let strongRight = right else { return false }
    return strongLeft.val == strongRight.val
      && isMirror(strongLeft.right, strongRight.left)
      && isMirror(strongLeft.left, strongRight.right)
  }
}
