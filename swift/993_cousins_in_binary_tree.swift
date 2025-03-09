class Solution {
  private var xParent: TreeNode? = nil
  private var yParent: TreeNode? = nil
  private var xDepth: Int = -1
  private var yDepth: Int = -1

  func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
    calcDepth(root, x: x, y: y, depth: 0, parent: nil)
    return xDepth == yDepth && xParent !== yParent
  }

  private func calcDepth(_ nullableNode: TreeNode?, x: Int, y: Int, depth: Int, parent: TreeNode?) {
    guard let node = nullableNode else { return }

    if node.val == x {
      xParent = parent
      xDepth = depth
    } else if node.val == y {
      yParent = parent
      yDepth = depth
    }

    calcDepth(node.left, x: x, y: y, depth: depth + 1, parent: node)
    calcDepth(node.right, x: x, y: y, depth: depth + 1, parent: node)
  }
}
