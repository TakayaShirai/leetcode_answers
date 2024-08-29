/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
  func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    var curA = headA
    var curB = headB

    while curA !== curB {
      curA = (curA != nil) ? curA!.next : headB
      curB = (curB != nil) ? curB!.next : headA
    }

    return curA
  }
}
