/// Definition for singly-linked list.
/// public class ListNode {
///     public var val: Int
///     public var next: ListNode?
///     public init() { self.val = 0; self.next = nil; }
///     public init(_ val: Int) { self.val = val; self.next = nil; }
///     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
/// }
class Solution {
  func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    guard let head = head else { return nil }

    let dummyHead = ListNode(0)

    var prev: ListNode? = dummyHead
    var cur: ListNode? = head
    var next: ListNode? = cur?.next

    dummyHead.next = cur

    while cur != nil {
      if cur!.val == val {
        prev?.next = next
        cur = next
        next = cur?.next
      } else {
        prev = prev?.next
        cur = cur?.next
        next = next?.next
      }
    }

    return dummyHead.next
  }
}
