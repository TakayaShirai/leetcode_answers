/// Definition for singly-linked list.
/// public class ListNode {
///     public var val: Int
///     public var next: ListNode?
///     public init() { self.val = 0; self.next = nil; }
///     public init(_ val: Int) { self.val = val; self.next = nil; }
///     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
/// }
class Solution {
  func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    guard head != nil else { return nil }

    let dummyHead: ListNode = ListNode(0)
    dummyHead.next = head

    var curNode: ListNode? = head

    while curNode != nil {
      var nextNode: ListNode? = curNode!.next

      while curNode?.val == nextNode?.val {
        curNode?.next = nextNode?.next
        nextNode = curNode?.next
      }

      curNode = curNode?.next
    }

    return dummyHead.next
  }
}
