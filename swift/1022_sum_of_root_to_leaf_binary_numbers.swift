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
  func sumRootToLeaf(_ root: TreeNode?) -> Int {
    return helper(node: root, currentSum: 0)
  }

  private func helper(node: TreeNode?, currentSum: Int) -> Int {
    guard let node = node else { return 0 }

    // Calculate the current running sum for this path
    let newSum = currentSum * 2 + node.val

    // If this is a leaf node, return the current sum
    if node.left == nil && node.right == nil {
      return newSum
    }

    // Otherwise, recurse on both subtrees and add the results
    return helper(node: node.left, currentSum: newSum)
      + helper(node: node.right, currentSum: newSum)
  }
}
