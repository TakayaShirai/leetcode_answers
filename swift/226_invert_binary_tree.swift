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
  func invertTree(_ root: TreeNode?) -> TreeNode? {
    // return bfsInvertTree(root)
    return dfsInvertTree(node: root)
  }

  func dfsInvertTree(node: TreeNode?) -> TreeNode? {
    guard let node = node else { return nil }

    let tmp: TreeNode? = node.left
    node.left = dfsInvertTree(node: node.right)
    node.right = dfsInvertTree(node: tmp)

    return node
  }

  func bfsInvertTree(_ root: TreeNode?) -> TreeNode? {
    var cur: TreeNode? = root
    var queue: [TreeNode] = []

    if cur != nil {
      queue.append(cur!)
    }

    while !queue.isEmpty {
      cur = queue.removeFirst()

      var tmpLeft = cur!.left
      cur!.left = cur!.right
      cur!.right = tmpLeft

      if cur!.left != nil {
        queue.append(cur!.left!)
      }

      if cur!.right != nil {
        queue.append(cur!.right!)
      }
    }

    return root
  }
}
