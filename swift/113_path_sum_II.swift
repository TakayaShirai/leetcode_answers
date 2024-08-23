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
  func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
    guard let root = root else { return [] }

    var res: [[Int]] = []

    func dfs(_ node: TreeNode?, _ curSum: Int, _ nodes: [Int]) {
      guard let node = node else { return }

      var nodes: [Int] = nodes
      nodes.append(node.val)

      if node.left == nil && node.right == nil && (curSum + node.val) == targetSum {
        res.append(nodes)
        return
      }

      dfs(node.left, curSum + node.val, nodes)
      dfs(node.right, curSum + node.val, nodes)
    }

    dfs(root, 0, [])

    return res
  }
}
