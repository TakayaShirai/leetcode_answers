/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

class Solution {
  func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let strongRoot = root else { return [] }

    var nodesQueue: [TreeNode] = [strongRoot]
    var eachLevelNodesVals: [[Int]] = []
    var isLeftToRight = true

    while !nodesQueue.isEmpty {
      let curLevelCnt: Int = nodesQueue.count
      var curLevelNodesVals: [Int] = []

      for _ in 0..<curLevelCnt {
        let curNode = nodesQueue.removeFirst()
        curLevelNodesVals.append(curNode.val)

        if let left = curNode.left {
          nodesQueue.append(left)
        }

        if let right = curNode.right {
          nodesQueue.append(right)
        }
      }

      if !isLeftToRight {
        curLevelNodesVals.reverse()
      }

      eachLevelNodesVals.append(curLevelNodesVals)
      isLeftToRight = !isLeftToRight
    }

    return eachLevelNodesVals
  }
}
