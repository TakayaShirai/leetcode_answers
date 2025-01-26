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
    var maxDiameter = 0
    updateDiameterAndCountEdges(root, maxDiameter: &maxDiameter)
    return maxDiameter
  }

  private func updateDiameterAndCountEdges(_ node: TreeNode?, maxDiameter: inout Int) -> Int {
    guard let node = node else { return 0 }

    let leftEdgesCnt = updateDiameterAndCountEdges(node.left, maxDiameter: &maxDiameter)
    let rightEdgesCnt = updateDiameterAndCountEdges(node.right, maxDiameter: &maxDiameter)

    maxDiameter = max(maxDiameter, leftEdgesCnt + rightEdgesCnt)

    return max(leftEdgesCnt, rightEdgesCnt) + 1
  }
}
