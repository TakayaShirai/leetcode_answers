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
  func getMinimumDifference(_ root: TreeNode?) -> Int {
    guard let root = root else { return -1 }
    var minDiff: Int = Int.max
    var prevVal: Int? = nil
    dfs(root, prevVal: &prevVal, minDiff: &minDiff)
    return minDiff
  }

  private func dfs(_ node: TreeNode?, prevVal: inout Int?, minDiff: inout Int) {
    guard let node = node else { return }

    dfs(node.left, prevVal: &prevVal, minDiff: &minDiff)

    if let prevVal = prevVal {
      minDiff = min(minDiff, abs(prevVal - node.val))
    }
    prevVal = node.val

    dfs(node.right, prevVal: &prevVal, minDiff: &minDiff)
  }
}
