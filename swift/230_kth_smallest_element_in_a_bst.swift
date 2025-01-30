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
    var kthMinVal: Int = 0
    var curIdx: Int = 1
    dfs(node: root, curIdx: &curIdx, kthMinVal: &kthMinVal, k: k)
    return kthMinVal
  }

  private func dfs(node: TreeNode?, curIdx: inout Int, kthMinVal: inout Int, k: Int) {
    guard let node = node else { return }

    dfs(node: node.left, curIdx: &curIdx, kthMinVal: &kthMinVal, k: k)

    if curIdx == k {
      kthMinVal = node.val
    }

    curIdx += 1

    dfs(node: node.right, curIdx: &curIdx, kthMinVal: &kthMinVal, k: k)
  }
}
