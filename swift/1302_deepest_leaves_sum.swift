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
  func deepestLeavesSum(_ root: TreeNode?) -> Int {
    guard let root = root else { return -1 }

    var res: Int = 0
    var queue: [TreeNode] = [root]

    while !queue.isEmpty {
      res = 0
      let count = queue.count

      for _ in 0..<count {
        let cur = queue.removeFirst()
        res += cur.val

        if cur.left != nil {
          queue.append(cur.left!)
        }

        if cur.right != nil {
          queue.append(cur.right!)
        }
      }
    }

    return res
  }
}
