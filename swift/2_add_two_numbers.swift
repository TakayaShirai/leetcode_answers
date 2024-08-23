/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

class Solution {
  /// addTwoNumbers returns the sum of two numbers as a linked list.
  func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let dummyHead: ListNode = ListNode(0)
    var curNode: ListNode = dummyHead

    var nodeOne: ListNode? = l1
    var nodeTwo: ListNode? = l2

    var carryUp: Int = 0

    while nodeOne != nil || nodeTwo != nil {
      let newNode: ListNode = ListNode(0)

      let nodeOneVal = nodeOne?.val ?? 0
      let nodeTwoVal = nodeTwo?.val ?? 0

      newNode.val = (nodeOneVal + nodeTwoVal + carryUp) % 10
      carryUp = (nodeOneVal + nodeTwoVal + carryUp) / 10

      curNode.next = newNode
      curNode = newNode

      nodeOne = nodeOne?.next
      nodeTwo = nodeTwo?.next
    }

    if carryUp == 1 {
      curNode.next = ListNode(1)
    }

    return dummyHead.next
  }
}
