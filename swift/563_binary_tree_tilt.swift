import XCTest

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

class SolutionTests: XCTestCase {

  var solution: Solution!

  override func setUp() {
    super.setUp()
    solution = Solution()
  }

  private func convertNumsArrayToTree(nums: [Int?], nodePos: Int) -> TreeNode? {
    guard nodePos < nums.count, let curNodeVal = nums[nodePos] else { return nil }

    let rootNode: TreeNode = TreeNode(curNodeVal)
    rootNode.left = convertNumsArrayToTree(nums: nums, nodePos: nodePos * 2 + 1)
    rootNode.right = convertNumsArrayToTree(nums: nums, nodePos: nodePos * 2 + 2)

    return rootNode
  }

  func testFindTilt_WhenGivenNilValue() {
    let root: TreeNode? = nil
    let tiltVal: Int = solution.findTilt(root)

    XCTAssertEqual(
      tiltVal, 0,
      "The tilt value should be 0 for an empty tree, but it was calculated as \(tiltVal).")
  }

  func testFindTilt_WhenGivenTreeWithSingleNode() {
    let nums: [Int?] = [1]
    let root = convertNumsArrayToTree(nums: nums, nodePos: 0)
    let tiltVal = solution.findTilt(root)

    XCTAssertEqual(
      tiltVal, 0,
      "The tilt value for a single-node tree should be 0, but it was calculated as \(tiltVal).")
  }

  func testFindTilt_WhenBinaryTreeIsDeep() {
    let nums: [Int?] = [4, 2, 9, 3, 5, nil, 7]
    let root: TreeNode? = convertNumsArrayToTree(nums: nums, nodePos: 0)
    let tiltVal: Int = solution.findTilt(root)

    XCTAssertEqual(
      tiltVal, 15, "The tilt value should be calculated as 15, but it was calculated as \(tiltVal)."
    )
  }
}
