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
  func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    guard !(p == nil && q == nil) else { return true }
    guard let strongP = p, let strongQ = q else { return false }
    let isLeftSame: Bool = isSameTree(strongP.left, strongQ.left)
    let isRightSame: Bool = isSameTree(strongP.right, strongQ.right)
    return isLeftSame && isRightSame && strongP.val == strongQ.val
  }
}
