import XCTest

class Solution {
  /// Check if the given tree is a balanced binary tree.
  ///
  /// - Parameters:
  ///   - root: The root node of the given tree.
  /// - Returns:
  ///   - The boolean value indicating if the given tree is a balanced binary tree.
  func isBalanced(root: TreeNode?) -> Bool {
    return isBalancedWithHeight(root: root).isBalanced
  }

  /// Check if the given tree is a balanced binary tree while calculating its height.
  ///
  /// - Parameters:
  ///   - root: The root node of the given tree.
  /// - Returns:
  ///   - The tuple consisting of the boolean value indicating if it is a balanced, and its height.
  private func isBalancedWithHeight(root: TreeNode?) -> (isBalanced: Bool, height: Int) {
    guard let root = root else { return (true, 0) }

    let leftSubtree = isBalancedWithHeight(root: root.left)
    let rightSubtree = isBalancedWithHeight(root: root.right)

    let isBalanced: Bool =
      (leftSubtree.isBalanced && rightSubtree.isBalanced)
      && abs(leftSubtree.height - rightSubtree.height) <= 1
    let height: Int = max(leftSubtree.height, rightSubtree.height) + 1

    return (isBalanced, height)
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
    let isBalanced: Bool = solution.isBalanced(root: nil)
    XCTAssertEqual(isBalanced, true, "Should return 'true' but returned \(isBalanced).")
  }

  func testIsBalancedWhenGivenBalancedTree() {
    let nums: [Int?] = [1, 2, 3, 4, 5, 6, 7]
    let root: TreeNode? = convertNumsToTree(nums: nums, nodePos: 0)
    let isBalanced: Bool = solution.isBalanced(root: root)
    XCTAssertEqual(isBalanced, true, "Should return 'true' but returned \(isBalanced).")
  }

  func testIsBalancedWhenGivenNonBalancedTree() {
    let nums: [Int?] = [1, 2, nil, 3, nil, 4]
    let root: TreeNode? = convertNumsToTree(nums: nums, nodePos: 0)
    let isBalanced: Bool = solution.isBalanced(root: root)
    XCTAssertEqual(isBalanced, false, "Should return 'false' but returned \(isBalanced).")
  }
}
