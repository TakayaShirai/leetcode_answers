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
  func preorderTraversal(_ root: TreeNode?) -> [Int] {
    var nodeValues: [Int] = []
    helperPreorder(root, &nodeValues)
    return nodeValues
  }

  private func helperPreorder(_ node: TreeNode?, _ nodeValues: inout [Int]) {
    guard let node = node else { return }

    nodeValues.append(node.val)
    helperPreorder(node.left, &nodeValues)
    helperPreorder(node.right, &nodeValues)
  }
}
