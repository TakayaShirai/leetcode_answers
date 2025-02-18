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

    let smallerVal: Int = min(p.val, q.val)
    let largerVal: Int = max(p.val, q.val)
    var curNode: TreeNode? = root

    while curNode != nil {
      if curNode!.val < smallerVal {
        curNode = curNode!.right
      } else if curNode!.val > largerVal {
        curNode = curNode!.left
      } else {
        return curNode
      }
    }

    return nil
  }
}
