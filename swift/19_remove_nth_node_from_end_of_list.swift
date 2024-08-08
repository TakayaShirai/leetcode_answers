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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummyHead = ListNode(0, head)
        var left: ListNode? = dummyHead
        var right: ListNode? = head
        var count: Int = 0
        
        while count < n && right != nil {
            right = right!.next
            count += 1
        }
        
        while right != nil {
            left = left!.next
            right = right!.next
        }
        
        left!.next = left!.next?.next
        
        return dummyHead.next
    }
}

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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummyHead = ListNode(0, head)
        var left: ListNode? = dummyHead
        var right: ListNode? = head
        var count: Int = 0
        
        while count < n && right != nil {
            right = right!.next
            count += 1
        }
        
        while right != nil {
            left = left!.next
            right = right!.next
        }
        
        left!.next = left!.next?.next
        
        return dummyHead.next
    }
}

