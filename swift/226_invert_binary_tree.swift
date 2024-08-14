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
    func invertTree(_ root: TreeNode?) -> TreeNode? {   
        // return bfsInvertTree(root)
        return dfsInvertTree(root)
    }
    
    func dfsInvertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        var tmpLeft = root!.left
        root!.left = root!.right
        root!.right = tmpLeft
                
        dfsInvertTree(root!.left)
        dfsInvertTree(root!.right)
                
        return root
    }
    
    func bfsInvertTree(_ root: TreeNode?) -> TreeNode? {
        var cur: TreeNode? = root
        var queue: [TreeNode] = []
        
        if cur != nil {
            queue.append(cur!)
        }
        
        while !queue.isEmpty {
            cur = queue.removeFirst()
            
            var tmpLeft = cur!.left
            cur!.left = cur!.right
            cur!.right = tmpLeft
            
            if cur!.left != nil {
                queue.append(cur!.left!)
            } 
            
            if cur!.right != nil {
                queue.append(cur!.right!)
            }
        }
        
        return root
    } 
}
