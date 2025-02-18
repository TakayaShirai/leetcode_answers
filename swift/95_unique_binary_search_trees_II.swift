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
  func generateTrees(_ n: Int) -> [TreeNode?] {
    return findAllPossibleBST(range: (1, n))
  }

  private func findAllPossibleBST(range: (left: Int, right: Int)) -> [TreeNode?] {
    let left: Int = range.left
    let right: Int = range.right

    guard left <= right else { return [nil] }
    guard left != right else { return [TreeNode(left)] }

    var possibleBSTs: [TreeNode?] = []

    for rootNodeVal in left...right {
      let leftSubtrees: [TreeNode?] = findAllPossibleBST(range: (left, rootNodeVal - 1))
      let rightSubtrees: [TreeNode?] = findAllPossibleBST(range: (rootNodeVal + 1, right))

      for leftSubtree in leftSubtrees {
        for rightSubtree in rightSubtrees {
          let root = TreeNode(rootNodeVal, leftSubtree, rightSubtree)
          possibleBSTs.append(root)
        }
      }
    }

    return possibleBSTs
  }
}
