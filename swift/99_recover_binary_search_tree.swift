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
  func recoverTree(_ root: TreeNode?) {
    var fstSwapNode: TreeNode? = nil
    var secSwapNode: TreeNode? = nil
    var prevNode: TreeNode? = nil

    findSwapNodes(
      node: root, fstSwapNode: &fstSwapNode, secSwapNode: &secSwapNode, prevNode: &prevNode)

    let tmp: Int = fstSwapNode!.val
    fstSwapNode!.val = secSwapNode!.val
    secSwapNode!.val = tmp
  }

  private func findSwapNodes(
    node: TreeNode?,
    fstSwapNode: inout TreeNode?,
    secSwapNode: inout TreeNode?,
    prevNode: inout TreeNode?
  ) {
    guard let node = node else { return }

    findSwapNodes(
      node: node.left, fstSwapNode: &fstSwapNode, secSwapNode: &secSwapNode, prevNode: &prevNode)

    if let prevNode = prevNode {
      if prevNode.val > node.val {
        if fstSwapNode == nil {
          fstSwapNode = prevNode
        }

        secSwapNode = node
      }
    }

    prevNode = node

    findSwapNodes(
      node: node.right, fstSwapNode: &fstSwapNode, secSwapNode: &secSwapNode, prevNode: &prevNode)
  }
}
