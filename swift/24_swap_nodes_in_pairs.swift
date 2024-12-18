/// Definition for singly-linked list.
/// public class ListNode {
///     public var val: Int
///     public var next: ListNode?
///     public init() { self.val = 0; self.next = nil; }
///     public init(_ val: Int) { self.val = val; self.next = nil; }
///     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
/// }
class Solution {
  func swapPairs(_ head: ListNode?) -> ListNode? {
    // Recursive
    guard var cur = head, var next = head?.next else { return head }

    if next.next == nil {
      next.next = cur
      cur.next = nil
    } else {
      let tmpNode: ListNode? = next.next
      next.next = cur
      cur.next = swapPairs(tmpNode)
    }

    return next

    // Iterative
    // if head == nil || head?.next == nil {
    //   return head
    // }

    // let dummyNode = ListNode(0)
    // dummyNode.next = head
    // var prev: ListNode? = dummyNode
    // var cur: ListNode? = head

    // while cur != nil && cur?.next != nil {
    //   let next = cur?.next
    //   let nextPair = next?.next

    //   next?.next = cur
    //   cur?.next = nextPair
    //   prev?.next = next

    //   prev = cur
    //   cur = nextPair
    // }

    // return dummyNode.next
  }
}
