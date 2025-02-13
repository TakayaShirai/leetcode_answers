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
  func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    var curNode: TreeNode? = root

    while curNode != nil {
      if curNode!.val == val {
        return curNode
      } else if curNode!.val < val {
        curNode = curNode!.right
      } else {
        curNode = curNode!.left
      }
    }

    return nil

    // guard let root = root else { return nil }
    // if root.val == val {
    //     return root
    // }
    // return root.val < val ? searchBST(root.right, val) : searchBST(root.left, val)
  }
}
