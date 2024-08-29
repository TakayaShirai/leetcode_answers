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

    var res: [[Int]] = []
    var queue: [TreeNode?] = []

    queue.append(root)

    while !queue.isEmpty {
      let count = queue.count
      var sameLevelVals: [Int] = []

      for _ in 0..<count {
        let cur = queue.removeFirst()!
        sameLevelVals.append(cur.val)

        if let left = cur.left {
          queue.append(left)
        }

        if let right = cur.right {
          queue.append(right)
        }
      }

      res.append(sameLevelVals)
    }

    return res
  }
}