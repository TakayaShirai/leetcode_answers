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
  func maxDepth(_ root: Node?) -> Int {
    var curMaxDepth: Int = 0
    dfs(root, curDepth: 1, curMaxDepth: &curMaxDepth)
    return curMaxDepth
  }

  private func dfs(_ node: Node?, curDepth: Int, curMaxDepth: inout Int) {
    guard let node = node else { return }
    curMaxDepth = max(curDepth, curMaxDepth)
    for child in node.children {
      dfs(child, curDepth: curDepth + 1, curMaxDepth: &curMaxDepth)
    }
  }
}
