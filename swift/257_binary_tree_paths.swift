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
  func binaryTreePaths(_ root: TreeNode?) -> [String] {
    guard let root = root else { return [""] }

    var routes: [String] = []
    dfs(root, "", &routes)
    return routes
  }

  private func dfs(_ node: TreeNode, _ curRootStr: String, _ routes: inout [String]) {
    if node.left == nil && node.right == nil {
      let updatedRootStr = curRootStr + String(node.val)
      routes.append(updatedRootStr)
      return
    }

    if node.left != nil {
      let updatedRootStr = curRootStr + String(node.val) + "->"
      dfs(node.left!, updatedRootStr, &routes)
    }

    if node.right != nil {
      let updatedRootStr = curRootStr + String(node.val) + "->"
      dfs(node.right!, updatedRootStr, &routes)
    }
  }
}
