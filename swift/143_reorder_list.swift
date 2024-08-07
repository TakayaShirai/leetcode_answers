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
    func reorderList(_ head: ListNode?) {
        var slow: ListNode? = head
        var fast: ListNode? = head?.next
        
        while fast != nil && fast?.next != nil {
            slow = slow!.next
            fast = fast!.next!.next
        }
        
        var second = reverseList(slow?.next)
        slow?.next = nil
        
        var cur: ListNode? = head
        
        while second != nil {
            let tmpOne = cur!.next
            let tmpTwo = second!.next
            cur!.next = second
            second!.next = tmpOne
            cur = tmpOne
            second = tmpTwo
        }
    }
    
    func reverseList (_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var cur: ListNode? = head
        var next: ListNode? = head?.next
        
        while cur != nil {
            next = cur!.next
            cur!.next = prev
            prev = cur
            cur = next
        }
        
        return prev
    }
}

