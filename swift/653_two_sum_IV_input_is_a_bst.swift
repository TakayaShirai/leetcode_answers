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
  func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
    let sortedNodesValues: [Int] = getSortedNodesValues(from: root)

    var left: Int = 0
    var right: Int = sortedNodesValues.count - 1

    while left < right {
      let smallerValue: Int = sortedNodesValues[left]
      let greaterValue: Int = sortedNodesValues[right]
      let curSum: Int = smallerValue + greaterValue

      if curSum == k {
        return true
      } else if curSum > k {
        right -= 1
      } else {
        left += 1
      }
    }

    return false
  }

  private func getSortedNodesValues(from root: TreeNode?) -> [Int] {
    var sortedNodesValues: [Int] = []
    dfs(curNode: root, sortedNodesValues: &sortedNodesValues)
    return sortedNodesValues
  }

  private func dfs(curNode: TreeNode?, sortedNodesValues: inout [Int]) {
    guard let curNode = curNode else { return }

    dfs(curNode: curNode.left, sortedNodesValues: &sortedNodesValues)
    sortedNodesValues.append(curNode.val)
    dfs(curNode: curNode.right, sortedNodesValues: &sortedNodesValues)
  }
}
