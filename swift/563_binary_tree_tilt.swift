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
  func findTilt(_ root: TreeNode?) -> Int {
    var totalTilt: Int = 0
    calcSumOfTreeAndAccumulateTotalTilt(root: root, totalTilt: &totalTilt)
    return totalTilt
  }

  private func calcSumOfTreeAndAccumulateTotalTilt(root: TreeNode?, totalTilt: inout Int) -> Int {
    guard let root = root else { return 0 }

    let leftSubtreeSum: Int = calcSumOfTreeAndAccumulateTotalTilt(
      root: root.left, totalTilt: &totalTilt)
    let rightSubtreeSum: Int = calcSumOfTreeAndAccumulateTotalTilt(
      root: root.right, totalTilt: &totalTilt)

    totalTilt += abs(leftSubtreeSum - rightSubtreeSum)

    return root.val + leftSubtreeSum + rightSubtreeSum
  }
}
