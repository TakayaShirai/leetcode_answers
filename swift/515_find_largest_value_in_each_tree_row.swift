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
  func largestValues(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }

    var res: [Int] = []
    var queue: [TreeNode] = [root]

    while !queue.isEmpty {
      let count = queue.count
      var max = queue[0].val

      for _ in 0..<count {
        let cur = queue.removeFirst()

        if cur.val > max {
          max = cur.val
        }

        if cur.left != nil {
          queue.append(cur.left!)
        }

        if cur.right != nil {
          queue.append(cur.right!)
        }
      }

      res.append(max)
    }

    return res
  }
}
