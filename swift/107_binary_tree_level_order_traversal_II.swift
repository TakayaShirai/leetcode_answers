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
  func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
    guard let strongRoot = root else { return [] }
    var bottomUpLayers: [[Int]] = []
    var nodesQueue: [TreeNode] = [strongRoot]

    while !nodesQueue.isEmpty {
      let curLevelNodesCnt: Int = nodesQueue.count
      var curLayerNodesVals: [Int] = []

      for _ in 0..<curLevelNodesCnt {
        let curNode: TreeNode = nodesQueue.removeFirst()

        if let leftNode = curNode.left {
          nodesQueue.append(leftNode)
        }

        if let rightNode = curNode.right {
          nodesQueue.append(rightNode)
        }

        curLayerNodesVals.append(curNode.val)
      }

      bottomUpLayers.append(curLayerNodesVals)
    }

    return Array(bottomUpLayers.reversed())
  }
}
