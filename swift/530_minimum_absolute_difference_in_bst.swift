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
    var minDiff: Int = Int.max
    var prevVal: Int = Int.max
    inorderDFS(nullableNode: root, minDiff: &minDiff, prevVal: &prevVal)
    return minDiff
  }

  private func inorderDFS(nullableNode: TreeNode?, minDiff: inout Int, prevVal: inout Int) {
    guard let curNode = nullableNode else { return }

    inorderDFS(nullableNode: curNode.left, minDiff: &minDiff, prevVal: &prevVal)

    minDiff = min(minDiff, abs(curNode.val - prevVal))
    prevVal = curNode.val

    inorderDFS(nullableNode: curNode.right, minDiff: &minDiff, prevVal: &prevVal)
  }
}
