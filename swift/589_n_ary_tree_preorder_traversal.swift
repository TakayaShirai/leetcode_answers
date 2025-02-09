/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
  func preorder(_ root: Node?) -> [Int] {
    var nodeVals: [Int] = []
    helperPreorder(root, nodeVals: &nodeVals)
    return nodeVals
  }

  private func helperPreorder(_ node: Node?, nodeVals: inout [Int]) {
    guard let node = node else { return }

    nodeVals.append(node.val)

    for child in node.children {
      helperPreorder(child, nodeVals: &nodeVals)
    }
  }
}
