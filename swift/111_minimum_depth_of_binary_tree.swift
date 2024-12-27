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
  func minDepth(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }

    var nodeQueue: [TreeNode] = [root]
    var curDepth: Int = 0

    while !nodeQueue.isEmpty {
      var sameLevelNodeCnt: Int = nodeQueue.count
      curDepth += 1

      for _ in 0..<sameLevelNodeCnt {
        let curNode = nodeQueue.removeFirst()

        if curNode.left == nil && curNode.right == nil {
          return curDepth
        }

        if curNode.left != nil {
          nodeQueue.append(curNode.left!)
        }

        if curNode.right != nil {
          nodeQueue.append(curNode.right!)
        }
      }
    }

    return curDepth
  }
}
