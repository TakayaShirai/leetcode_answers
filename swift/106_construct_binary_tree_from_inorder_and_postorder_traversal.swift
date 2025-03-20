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
  private enum NodeSearchError: Error {
    case NoCorrespondNodeError
  }

  func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
    guard !inorder.isEmpty && !postorder.isEmpty else { return nil }

    var root: TreeNode? = TreeNode(postorder[postorder.count - 1])
    let rootNodeSearchRes = findRootNode(in: inorder, rootNodeVal: root!.val)

    switch rootNodeSearchRes {
    case .success(let rootNodeIdx):
      let leftInorderNodes: [Int] = Array(inorder[0..<rootNodeIdx])
      let leftPostorderNodes: [Int] = Array(postorder[0..<rootNodeIdx])
      let rightInorderNodes: [Int] = Array(inorder[(rootNodeIdx + 1)...])
      let rightPostorderNodes: [Int] = Array(postorder[rootNodeIdx..<(postorder.count - 1)])

      root!.left = buildTree(leftInorderNodes, leftPostorderNodes)
      root!.right = buildTree(rightInorderNodes, rightPostorderNodes)

      return root
    case .failure:
      return nil
    }
  }

  private func findRootNode(in inorder: [Int], rootNodeVal: Int) -> Result<Int, NodeSearchError> {
    for (idx, num) in inorder.enumerated() {
      guard num != rootNodeVal else {
        return .success(idx)
      }
    }

    return .failure(NodeSearchError.NoCorrespondNodeError)
  }
}
