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
    return calcHeightAndIsBalanced(root).isBalanced

    func calcHeightAndIsBalanced(_ root: TreeNode?) -> (isBalanced: Bool, height: Int) {
      if root == nil {
        return (true, 0)
      }

      let left = calcHeightAndIsBalanced(root!.left)
      let right = calcHeightAndIsBalanced(root!.right)

      let isBalanced =
        (left.isBalanced && right.isBalanced) && (abs(left.height - right.height) <= 1)

      return (isBalanced, (max(left.height, right.height) + 1))
    }
  }
}

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
    return calcHeightAndIsBalanced(root).isBalanced

    func calcHeightAndIsBalanced(_ root: TreeNode?) -> (isBalanced: Bool, height: Int) {
      if root == nil {
        return (true, 0)
      }

      let left = calcHeightAndIsBalanced(root!.left)
      let right = calcHeightAndIsBalanced(root!.right)

      let isBalanced =
        (left.isBalanced && right.isBalanced) && (abs(left.height - right.height) <= 1)

      return (isBalanced, (max(left.height, right.height) + 1))
    }
  }
}
