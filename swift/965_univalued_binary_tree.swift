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
  func isUnivalTree(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }

    let leftSubtreeRootVal: Int = root.left != nil ? root.left!.val : root.val
    let rightSubtreeRootVal: Int = root.right != nil ? root.right!.val : root.val
    let hasSameVals: Bool = root.val == leftSubtreeRootVal && root.val == rightSubtreeRootVal

    return isUnivalTree(root.left) && isUnivalTree(root.right) && hasSameVals
  }
}
