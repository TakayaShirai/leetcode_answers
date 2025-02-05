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
  /// Returns the sum of all node tilts in a binary tree.
  ///
  /// - Parameters:
  ///   - root: The root node of a binary tree.
  /// - Returns: The sum of all node tilts in a binary tree.
  func findTilt(_ root: TreeNode?) -> Int {
    var totalTilt: Int = 0
    calcTiltWithSubtreeSum(root: root, totalTilt: &totalTilt)
    return totalTilt
  }

  /// Returns the sum of all node values in a binary tree while accumulating the total tilt.
  ///
  /// - Parameters:
  ///   - root: The root node of a binary tree.
  ///   - totalTilt: The cumulative tilt value of visited nodes.
  /// - Returns: The sum of all node values in a binary tree.
  private func calcTiltWithSubtreeSum(root: TreeNode?, totalTilt: inout Int) -> Int {
    guard let root = root else { return 0 }

    let leftSubtreeSum: Int = calcTiltWithSubtreeSum(root: root.left, totalTilt: &totalTilt)
    let rightSubtreeSum: Int = calcTiltWithSubtreeSum(root: root.right, totalTilt: &totalTilt)

    totalTilt += abs(leftSubtreeSum - rightSubtreeSum)

    return root.val + leftSubtreeSum + rightSubtreeSum
  }
}
