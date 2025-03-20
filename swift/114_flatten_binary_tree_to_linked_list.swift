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
  func flatten(_ root: TreeNode?) {
    guard let strongRoot = root else { return }

    flatten(strongRoot.left)
    flatten(strongRoot.right)

    if strongRoot.left == nil {
      return
    }

    var curNode = strongRoot.left
    while curNode?.right != nil {
      curNode = curNode?.right
    }

    curNode?.right = strongRoot.right

    strongRoot.right = strongRoot.left

    strongRoot.left = nil
  }
}
