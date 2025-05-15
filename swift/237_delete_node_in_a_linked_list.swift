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
  func deleteNode(_ node: ListNode?) {
    guard let nonNullNode = node, let nextNode = nonNullNode.next else { return }
    nonNullNode.val = nextNode.val
    nonNullNode.next = nextNode.next
  }
}
