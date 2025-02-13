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
  func minDiffInBST(_ root: TreeNode?) -> Int {
    var curMinDiff: Int = Int.max
    var prevVal: Int? = nil
    helperInorderDfs(node: root, curMinDiff: &curMinDiff, prevVal: &prevVal)
    return curMinDiff
  }

  private func helperInorderDfs(node: TreeNode?, curMinDiff: inout Int, prevVal: inout Int?) {
    guard let node = node else { return }

    helperInorderDfs(node: node.left, curMinDiff: &curMinDiff, prevVal: &prevVal)

    if prevVal != nil {
      let diff: Int = abs(node.val - prevVal!)
      curMinDiff = min(curMinDiff, diff)
    }

    prevVal = node.val

    helperInorderDfs(node: node.right, curMinDiff: &curMinDiff, prevVal: &prevVal)
  }
}
