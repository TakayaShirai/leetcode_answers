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
  func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    var curMaxDiameter = 0
    computeTreeDepthAndCurrentMaxDiameter(root, curMaxDiameter: &curMaxDiameter)
    return curMaxDiameter
  }

  private func computeTreeDepthAndCurrentMaxDiameter(_ node: TreeNode?, curMaxDiameter: inout Int)
    -> Int
  {
    guard let node = node else { return 0 }

    let leftSubtreeDepth = computeTreeDepthAndCurrentMaxDiameter(
      node.left, curMaxDiameter: &curMaxDiameter)
    let rightSubtreeDepth = computeTreeDepthAndCurrentMaxDiameter(
      node.right, curMaxDiameter: &curMaxDiameter)

    curMaxDiameter = max(curMaxDiameter, leftSubtreeDepth + rightSubtreeDepth)

    return max(leftSubtreeDepth, rightSubtreeDepth) + 1
  }
}
