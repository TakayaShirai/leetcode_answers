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
  func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var nodes: [Int] = []
    updateNodes(root, &nodes)
    return nodes
  }

  private func updateNodes(_ node: TreeNode?, _ nodes: inout [Int]) {
    guard let node = node else { return }

    if node.left != nil {
      updateNodes(node.left, &nodes)
    }

    nodes.append(node.val)

    if node.right != nil {
      updateNodes(node.right, &nodes)
    }

    return
  }
}
