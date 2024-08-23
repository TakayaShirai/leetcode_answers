/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var next: Node?
 *     public var random: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *         self.random = nil
 *     }
 * }
 */

class Solution {
  func copyRandomList(_ head: Node?) -> Node? {
    guard let head = head else { return nil }

    var copyNodes: [Node: Node] = [:]
    var cur: Node? = head

    while cur != nil {
      copyNodes[cur!] = Node(cur!.val)
      cur = cur!.next
    }

    cur = head

    while cur != nil {
      if let next = cur!.next {
        copyNodes[cur!]!.next = copyNodes[next]
      } else {
        copyNodes[cur!]!.next = nil
      }

      if let random = cur!.random {
        copyNodes[cur!]!.random = copyNodes[random]
      } else {
        copyNodes[cur!]!.random = nil
      }

      cur = cur!.next
    }

    return copyNodes[head]
  }
}
