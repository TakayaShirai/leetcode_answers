/// Definition for singly-linked list.
/// public class ListNode {
///     public var val: Int
///     public var next: ListNode?
///     public init() { self.val = 0; self.next = nil; }
///     public init(_ val: Int) { self.val = val; self.next = nil; }
///     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
/// }
class Solution {
  func sortList(_ head: ListNode?) -> ListNode? {
    guard head != nil && head!.next != nil else { return head }

    var leftHalfNodesHead: ListNode? = head
    let middleNode: ListNode? = getMiddleNode(of: head)
    var rightHalfNodesHead: ListNode? = middleNode?.next
    middleNode?.next = nil

    var sortedLeftNodesHead: ListNode? = sortList(leftHalfNodesHead)
    var sortedRightNodesHead: ListNode? = sortList(rightHalfNodesHead)

    return mergeLists(sortedLeftNodesHead, sortedRightNodesHead)
  }

  private func getMiddleNode(of root: ListNode?) -> ListNode? {
    var slow: ListNode? = root
    var fast: ListNode? = root?.next

    while fast != nil && fast!.next != nil {
      slow = slow!.next
      fast = fast!.next!.next
    }

    return slow
  }

  private func mergeLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    let dummyHead: ListNode = ListNode()
    var curTailNode: ListNode = dummyHead

    var list1CurNode: ListNode? = list1
    var list2CurNode: ListNode? = list2

    while list1CurNode != nil && list2CurNode != nil {
      if list1CurNode!.val < list2CurNode!.val {
        curTailNode.next = list1CurNode
        list1CurNode = list1CurNode!.next
      } else {
        curTailNode.next = list2CurNode
        list2CurNode = list2CurNode!.next
      }

      curTailNode = curTailNode.next!
    }

    if list1CurNode != nil {
      curTailNode.next = list1CurNode
    }

    if list2CurNode != nil {
      curTailNode.next = list2CurNode
    }

    return dummyHead.next
  }
}
