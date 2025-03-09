/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

import XCTest

class Solution {
  /// Check if the given tree is a balanced binary tree.
  ///
  /// - Parameters:
  ///   - root: The root node of the given tree.
  /// - Returns:
  ///   - The boolean value indicating if the given tree is a balanced binary tree.
  func isBalanced(_ root: TreeNode?) -> Bool {
    var treeHeight: Int = 0
    return isBalanced(nullableRoot: root, height: &treeHeight)
  }

  /// Check if the given tree is a balanced binary tree while calculating its height.
  ///
  /// - Parameters:
  ///   - root: The root node of the given tree.
  /// - Returns:
  ///   - The tuple consisting of the boolean value indicating if the tree is balanced, and its height.
  private func isBalanced(nullableRoot: TreeNode?, height: inout Int) -> Bool {
    guard let root = nullableRoot else { return true }

    var leftSubtreeHeight: Int = 0
    var rightSubtreeHeight: Int = 0
    let isLeftBalanced = isBalanced(nullableRoot: root.left, height: &leftSubtreeHeight)
    let isRightBalanced = isBalanced(nullableRoot: root.right, height: &rightSubtreeHeight)

    height = max(leftSubtreeHeight, rightSubtreeHeight) + 1

    return isLeftBalanced && isRightBalanced && abs(leftSubtreeHeight - rightSubtreeHeight) <= 1
  }
}

class SolutionTest: XCTestCase {
  var solution: Solution!

  override func setUp() {
    super.setUp()
    solution = Solution()
  }

  private func convertNumsToTree(nums: [Int?], nodePos: Int) -> TreeNode? {
    guard nodePos < nums.count, let curNodeVal = nums[nodePos] else { return nil }

    let rootNode = TreeNode(curNodeVal)
    rootNode.left = convertNumsToTree(nums: nums, nodePos: nodePos * 2 + 1)
    rootNode.right = convertNumsToTree(nums: nums, nodePos: nodePos * 2 + 2)

    return rootNode
  }

  func testIsBalancedWhenGivenNil() {
    let isBalanced: Bool = solution.isBalanced(nil)
    XCTAssertEqual(isBalanced, true, "Should return 'true' but returned \(isBalanced).")
  }

  func testIsBalancedWhenGivenBalancedTree() {
    let nums: [Int?] = [1, 2, 3, 4, 5, 6, 7]
    let root: TreeNode? = convertNumsToTree(nums: nums, nodePos: 0)
    let isBalanced: Bool = solution.isBalanced(root)
    XCTAssertEqual(isBalanced, true, "Should return 'true' but returned \(isBalanced).")
  }

  func testIsBalancedWhenGivenNonBalancedTree() {
    let nums: [Int?] = [1, 2, nil, 3, nil, 4]
    let root: TreeNode? = convertNumsToTree(nums: nums, nodePos: 0)
    let isBalanced: Bool = solution.isBalanced(root)
    XCTAssertEqual(isBalanced, false, "Should return 'false' but returned \(isBalanced).")
  }
}
