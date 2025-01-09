/// Definition for singly-linked list.
/// public class ListNode {
///     public var val: Int
///     public var next: ListNode?
///     public init() { self.val = 0; self.next = nil; }
///     public init(_ val: Int) { self.val = val; self.next = nil; }
///     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
/// }
class Solution {
  func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    // 1. Count the total number of nodes in the list.
    // 2. Calculate the effective rotation count.
    // 3. Split the list into two parts:
    //    - The left part will contain the first (nodeCount - rotateCount) nodes.
    //    - The right part will contain the remaining nodes.
    // 4. Reconnect the end of the right part to the head of the left part.
    //    the next node of the last node in the Right part be the first node of the Left part,
    // 5. Return the head of the right part, which becomes the new head of the rotated list.

    guard head != nil else { return nil }

    let nodeCount: Int = countNumOfNodes(head)
    let rotateCount: Int = k % nodeCount

    if rotateCount == 0 {
      return head
    }

    var leftFirst: ListNode? = head
    var leftEnd: ListNode? = nil
    var rightFirst: ListNode? = nil
    var rightEnd: ListNode? = nil

    var curNode: ListNode? = head
    var visitCount: Int = 0

    while curNode != nil {
      visitCount += 1

      if visitCount == nodeCount - rotateCount {
        leftEnd = curNode
        rightFirst = curNode?.next
      }

      if visitCount == nodeCount {
        rightEnd = curNode
      }

      curNode = curNode?.next
    }

    leftEnd?.next = nil
    rightEnd?.next = leftFirst

    return rightFirst
  }

  private func countNumOfNodes(_ head: ListNode?) -> Int {
    var count: Int = 0
    var curNode: ListNode? = head

    while curNode != nil {
      count += 1
      curNode = curNode?.next
    }

    return count
  }
}
