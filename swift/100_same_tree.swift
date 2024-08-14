/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        return dfsIsSameTree(p, q)
        // return bfsIsSameTree(p, q)
    }
    
    func dfsIsSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        
        let isLeftSame = dfsIsSameTree(p?.left, q?.left)
        let isRightSame = dfsIsSameTree(p?.right, q?.right)
        
        if p?.val == q?.val && isLeftSame && isRightSame {
            return true
        }
        
        return false
    }
    
    func bfsIsSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var queueP: [TreeNode?] = [p]
        var queueQ: [TreeNode?] = [q]
        
        while !queueP.isEmpty && !queueQ.isEmpty {
            var curP = queueP.removeFirst()
            var curQ = queueQ.removeFirst()
            
            if curP?.val != curQ?.val {
                return false
            }
            
            if curP != nil {
                queueP.append(curP!.left)
                queueP.append(curP!.right)
            }
            
            if curQ != nil {
                queueQ.append(curQ!.left)
                queueQ.append(curQ!.right)
            }
        }
        
        return true
    }
}

