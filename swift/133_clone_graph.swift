/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */

class Solution {
  func cloneGraph(_ node: Node?) -> Node? {
    guard let node else { return nil }

    var curToNewMap: [Node: Node] = [:]

    func dfs(_ node: Node) -> Node {
      if let newNode = curToNewMap[node] {
        return newNode
      }

      let newNode = Node(node.val)
      curToNewMap[node] = newNode

      for neighbor in node.neighbors {
        newNode.neighbors.append(dfs(neighbor!))
      }

      return newNode
    }

    return dfs(node)
  }
}
