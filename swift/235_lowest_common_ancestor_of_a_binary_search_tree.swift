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
    guard let root = root, let p = p, let q = q else { return nil }
    var largerNode: TreeNode = p.val > q.val ? p : q
    var smallerNode: TreeNode = p.val < q.val ? p : q

    var cur: TreeNode? = root

    while cur != nil {
      if smallerNode.val <= cur!.val && cur!.val <= largerNode.val {
        return cur
      } else if cur!.val > largerNode.val {
        cur = cur!.left
      } else {
        cur = cur!.right
      }
    }

    return nil
  }
}
