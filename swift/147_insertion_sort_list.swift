/// Definition for singly-linked list.
/// public class ListNode {
///     public var val: Int
///     public var next: ListNode?
///     public init() { self.val = 0; self.next = nil; }
///     public init(_ val: Int) { self.val = val; self.next = nil; }
///     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
/// }
class Solution {
  func insertionSortList(_ head: ListNode?) -> ListNode? {
    let dummyNode = ListNode(0)
    var curNode = head

    while curNode != nil {
      let nextNode = curNode!.next

      var prevNode = dummyNode
      while prevNode.next != nil && prevNode.next!.val < curNode!.val {
        prevNode = prevNode.next!
      }

      curNode!.next = prevNode.next
      prevNode.next = curNode

      curNode = nextNode
    }

    return dummyNode.next
  }
}
