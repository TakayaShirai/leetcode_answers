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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var cur: ListNode? = head
        var next: ListNode? = head?.next
        
        while cur != nil {
            cur?.next = prev
            prev = cur!
            cur = next
            next = cur?.next
        }
        
        return prev
        
        // recursiveReverseList(nil, head)
    }
    
    func recursiveReverseList(_ prev: ListNode?, _ cur: ListNode?) -> ListNode? {
        if cur == nil {
            return prev
        }
        
        var next: ListNode? = cur!.next
        cur!.next = prev
        return recursiveReverseList(cur, next)
    }
}

