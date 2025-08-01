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
  func balanceBST(_ root: TreeNode?) -> TreeNode? {
    guard let root else { return nil }

    var sortedVals: [Int] = []
    convertToSortedVals(from: root, sortedVals: &sortedVals)

    return buildBalancedBST(from: sortedVals)
  }

  private func buildBalancedBST(from nums: [Int]) -> TreeNode? {
    guard !nums.isEmpty else { return nil }
    let midIdx: Int = nums.count / 2
    let midNum: Int = nums[midIdx]

    let root: TreeNode = TreeNode(midNum)

    let leftNums: [Int] = Array(nums[0..<midIdx])
    let rightNums: [Int] = Array(nums[(midIdx + 1)...])

    root.left = buildBalancedBST(from: leftNums)
    root.right = buildBalancedBST(from: rightNums)

    return root
  }

  private func convertToSortedVals(from root: TreeNode?, sortedVals: inout [Int]) {
    guard let root else { return }
    convertToSortedVals(from: root.left, sortedVals: &sortedVals)
    sortedVals.append(root.val)
    convertToSortedVals(from: root.right, sortedVals: &sortedVals)
  }
}
