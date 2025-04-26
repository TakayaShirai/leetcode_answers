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
  func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    guard !nums.isEmpty else { return nil }
    guard nums.count != 1 else { return TreeNode(nums[0]) }

    let midIdx: Int = nums.count / 2

    let rootNode: TreeNode? = TreeNode(nums[midIdx])
    let leftNode: TreeNode? = sortedArrayToBST(Array(nums[0..<midIdx]))
    let rightNode: TreeNode? = sortedArrayToBST(Array(nums[(midIdx + 1)...]))

    rootNode!.left = leftNode
    rootNode!.right = rightNode

    return rootNode
  }
}
