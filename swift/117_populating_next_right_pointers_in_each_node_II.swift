/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *	   public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class Solution {
  func connect(_ root: Node?) -> Node? {
    // Time: O(n), Space: O(1)
    var nextLevelStartNode: Node? = root

    while nextLevelStartNode != nil {
      var curNode: Node? = nextLevelStartNode
      var weakPrevNode: Node? = nil
      nextLevelStartNode = nil

      while curNode != nil {
        if let leftNode = curNode!.left {
          if nextLevelStartNode == nil {
            nextLevelStartNode = leftNode
          }

          if let prevNode = weakPrevNode {
            prevNode.next = leftNode
          }

          weakPrevNode = leftNode
        }

        if let rightNode = curNode!.right {
          if nextLevelStartNode == nil {
            nextLevelStartNode = rightNode
          }

          if let prevNode = weakPrevNode {
            prevNode.next = rightNode
          }

          weakPrevNode = rightNode
        }

        curNode = curNode!.next
      }
    }

    return root

    // Time: O(n), Space: O(n)
    // guard let strongRoot = root else { return nil }
    // var nodesQueue: [Node] = [strongRoot]

    // while !nodesQueue.isEmpty {
    //   let curLevelNodesCnt: Int = nodesQueue.count
    //   var weakPrevNode: Node? = nil

    //   for idx in 0..<curLevelNodesCnt {
    //     let curNode: Node = nodesQueue.removeFirst()

    //     if let strongPrevNode = weakPrevNode {
    //       strongPrevNode.next = curNode
    //     }

    //     if let leftNode = curNode.left {
    //       nodesQueue.append(leftNode)
    //     }

    //     if let rightNode = curNode.right {
    //       nodesQueue.append(rightNode)
    //     }

    //     weakPrevNode = curNode
    //   }
    // }

    // return root
  }
}
