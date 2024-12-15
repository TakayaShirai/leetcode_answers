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
  func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }

    var leftLeavesSum: Int = 0
    var nodeQueue: [TreeNode] = [root]

    while !nodeQueue.isEmpty {
      let curNode = nodeQueue.removeFirst()

      if let leftNode = curNode.left {
        if leftNode.left == nil && leftNode.right == nil {
          leftLeavesSum += leftNode.val
        } else {
          nodeQueue.append(leftNode)
        }
      }

      if let rightNode = curNode.right {
        nodeQueue.append(rightNode)
      }
    }

    return leftLeavesSum
  }
}