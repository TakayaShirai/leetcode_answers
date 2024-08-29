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
  func goodNodes(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }

    var res: Int = 0
    dfs(root, root.val)

    return res

    func dfs(_ node: TreeNode?, _ maxVal: Int) {
      guard let node = node else { return }
      var val = maxVal

      if node.val >= val {
        res += 1
        val = node.val
      }

      dfs(node.left, val)
      dfs(node.right, val)
    }
  }
}
