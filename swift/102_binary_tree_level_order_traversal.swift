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
  func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }

    var queue: [TreeNode] = [root]
    var eachLevelNodes: [[Int]] = []

    while !queue.isEmpty {
      let curLevelNodesCnt: Int = queue.count
      var curLevelNodes: [Int] = []

      for _ in 0..<curLevelNodesCnt {
        let curNode: TreeNode = queue.removeFirst()

        if curNode.left != nil {
          queue.append(curNode.left!)
        }

        if curNode.right != nil {
          queue.append(curNode.right!)
        }

        curLevelNodes.append(curNode.val)
      }

      eachLevelNodes.append(curLevelNodes)
    }

    return eachLevelNodes
  }
}
