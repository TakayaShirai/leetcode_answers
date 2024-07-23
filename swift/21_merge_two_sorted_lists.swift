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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var curL1: ListNode? = list1
        var curL2: ListNode? = list2
        
        let dummyHead: ListNode = ListNode()
        var curNode: ListNode = dummyHead
        
        while curL1 != nil && curL2 != nil {
            if curL1!.val < curL2!.val {
                curNode.next = ListNode(curL1!.val)
                curL1 = curL1!.next
            } else {
                curNode.next = ListNode(curL2!.val)
                curL2 = curL2!.next
            }
            
            curNode = curNode.next!
        }
        
        if curL1 != nil {
            curNode.next = curL1!
        } else if curL2 != nil {
            curNode.next = curL2!
        }
        
        return dummyHead.next
    }
}

