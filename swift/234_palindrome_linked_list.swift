/// Definition for singly-linked list.
/// public class ListNode {
///     public var val: Int
///     public var next: ListNode?
///     public init() { self.val = 0; self.next = nil; }
///     public init(_ val: Int) { self.val = val; self.next = nil; }
///     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
/// }
class Solution {
  func isPalindrome(_ head: ListNode?) -> Bool {
    // Two Pointers
    guard head != nil else { return true }

    var slow: ListNode? = head
    var fast: ListNode? = head?.next

    while fast != nil {
      slow = slow?.next
      fast = fast?.next?.next
    }

    var middleNode: ListNode? = slow
    var curReversedListNode: ListNode? = reverseLinkedList(middleNode)
    var curOriginListNode: ListNode? = head

    while curOriginListNode != nil && curReversedListNode != nil {
      if curOriginListNode!.val != curReversedListNode!.val {
        return false
      }

      curOriginListNode = curOriginListNode!.next
      curReversedListNode = curReversedListNode!.next
    }

    return true

    // Using Array
    // let nodesArray: [Int] = createArray(head)

    // var left: Int = 0
    // var right: Int = nodesArray.count - 1

    // while left < right {
    //     if nodesArray[left] != nodesArray[right] {
    //         return false
    //     }

    //     left += 1
    //     right -= 1
    // }

    // return true
  }

  private func reverseLinkedList(_ head: ListNode?) -> ListNode? {
    var prev: ListNode? = nil
    var cur: ListNode? = head
    var next: ListNode? = head?.next

    while cur != nil {
      cur!.next = prev
      prev = cur
      cur = next
      next = next?.next
    }

    return prev
  }

  private func createArray(_ head: ListNode?) -> [Int] {
    var curNode: ListNode? = head
    var nodesArray: [Int] = []

    while curNode != nil {
      nodesArray.append(curNode!.val)
      curNode = curNode!.next
    }

    return nodesArray
  }
}
