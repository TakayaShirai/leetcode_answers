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
  func increasingBST(_ root: TreeNode?) -> TreeNode? {
    var dummyNode = TreeNode(0)
    var curBSTNode: TreeNode? = dummyNode
    helperInorderDFS(node: root, curBSTNode: &curBSTNode)
    return dummyNode.right
  }

  private func helperInorderDFS(node: TreeNode?, curBSTNode: inout TreeNode?) {
    guard let node = node else { return }
    helperInorderDFS(node: node.left, curBSTNode: &curBSTNode)
    curBSTNode?.right = TreeNode(node.val)
    curBSTNode = curBSTNode?.right
    helperInorderDFS(node: node.right, curBSTNode: &curBSTNode)
  }
}
