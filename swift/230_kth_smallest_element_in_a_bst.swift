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
    var curIdx: Int = 0
    var kthSmallestNum: Int = 0
    helperInorderDfs(curIdx: &curIdx, nullableNode: root, k: k, kthSmallest: &kthSmallestNum)
    return kthSmallestNum
  }

  private func helperInorderDfs(
    curIdx: inout Int, nullableNode: TreeNode?, k: Int, kthSmallest: inout Int
  ) {
    guard let curNode = nullableNode else { return }

    helperInorderDfs(curIdx: &curIdx, nullableNode: curNode.left, k: k, kthSmallest: &kthSmallest)
    curIdx += 1
    guard curIdx != k else {
      kthSmallest = curNode.val
      return
    }
    helperInorderDfs(curIdx: &curIdx, nullableNode: curNode.right, k: k, kthSmallest: &kthSmallest)
  }
}
