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
  func postorder(_ root: Node?) -> [Int] {
    var nodeVals: [Int] = []
    helperPostorder(root, nodeVals: &nodeVals)
    return nodeVals
  }

  private func helperPostorder(_ node: Node?, nodeVals: inout [Int]) {
    guard let node = node else { return }

    for child in node.children {
      helperPostorder(child, nodeVals: &nodeVals)
    }

    nodeVals.append(node.val)
  }
}
