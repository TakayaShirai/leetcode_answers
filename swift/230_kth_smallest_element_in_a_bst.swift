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
  func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    guard let root = root else { return -1 }
    var res: Int = -1
    var cur: Int = 0

    func dfs(_ node: TreeNode?, _ index: Int) {
      guard let node = node else { return }

      dfs(node.left, index)
      cur += 1

      if cur == k {
        res = node.val
        return
      }

      dfs(node.right, cur + 1)
    }

    dfs(root, cur)
    return res
  }
}
