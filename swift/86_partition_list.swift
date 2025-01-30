/// Definition for singly-linked list.
/// public class ListNode {
///     public var val: Int
///     public var next: ListNode?
///     public init() { self.val = 0; self.next = nil; }
///     public init(_ val: Int) { self.val = val; self.next = nil; }
///     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
/// }
class Solution {
  func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
    var dummyLessThanXHead: ListNode = ListNode()
    var dummyGreaterThanXHead: ListNode = ListNode()

    var lessNode: ListNode = dummyLessThanXHead
    var greaterNode: ListNode = dummyGreaterThanXHead

    var curNode: ListNode? = head

    while curNode != nil {
      if curNode!.val < x {
        lessNode.next = curNode
        lessNode = lessNode.next!
      } else {
        greaterNode.next = curNode
        greaterNode = greaterNode.next!
      }

      curNode = curNode!.next
    }

    greaterNode.next = nil
    lessNode.next = dummyGreaterThanXHead.next

    return dummyLessThanXHead.next
  }
}
