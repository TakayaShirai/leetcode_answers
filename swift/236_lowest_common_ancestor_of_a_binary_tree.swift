/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
  func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root = root, p !== root && q !== root else { return root }

    let leftSubtreeResult: TreeNode? = lowestCommonAncestor(root.left, p, q)
    let rightSubtreeResult: TreeNode? = lowestCommonAncestor(root.right, p, q)

    if leftSubtreeResult != nil && rightSubtreeResult != nil {
      return root
    }

    return leftSubtreeResult ?? rightSubtreeResult
  }
}
