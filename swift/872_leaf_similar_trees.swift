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
  func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
    return findLeafNodes(of: root1) == findLeafNodes(of: root2)
  }

  private func findLeafNodes(of root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    var leafNodesVals: [Int] = []
    helperDfs(node: root, leafNodesVals: &leafNodesVals)
    return leafNodesVals
  }

  private func helperDfs(node: TreeNode?, leafNodesVals: inout [Int]) {
    guard let node = node else { return }
    guard node.left != nil || node.right != nil else {
      leafNodesVals.append(node.val)
      return
    }

    helperDfs(node: node.left, leafNodesVals: &leafNodesVals)
    helperDfs(node: node.right, leafNodesVals: &leafNodesVals)
  }
}
