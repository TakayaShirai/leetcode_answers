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
  func postorderTraversal(_ root: TreeNode?) -> [Int] {
    var nodeValues: [Int] = []
    helperPostorder(root, &nodeValues)
    return nodeValues
  }

  private func helperPostorder(_ node: TreeNode?, _ nodeValues: inout [Int]) {
    guard let node = node else { return }

    helperPostorder(node.left, &nodeValues)
    helperPostorder(node.right, &nodeValues)
    nodeValues.append(node.val)
  }
}
