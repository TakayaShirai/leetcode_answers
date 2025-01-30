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
  func averageOfLevels(_ root: TreeNode?) -> [Double] {
    guard let root = root else { return [] }

    var averageOfEachLevel: [Double] = []
    var sameLevelNodes: [TreeNode] = [root]

    while !sameLevelNodes.isEmpty {
      let sameLevelNodesCnt: Int = sameLevelNodes.count
      var total: Int = 0

      for _ in 0..<sameLevelNodesCnt {
        let curNode: TreeNode = sameLevelNodes.removeFirst()

        total += curNode.val

        if curNode.left != nil {
          sameLevelNodes.append(curNode.left!)
        }

        if curNode.right != nil {
          sameLevelNodes.append(curNode.right!)
        }
      }

      averageOfEachLevel.append(Double(total) / Double(sameLevelNodesCnt))
    }

    return averageOfEachLevel
  }
}
