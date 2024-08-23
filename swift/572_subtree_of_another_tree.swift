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
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        guard let subRoot = subRoot else { return true }
        guard let root = root else { return false }
        
        if isSameTree(root, subRoot) {
            return true
        }
        
        return isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot)
    }
    
    func isSameTree(_ treeA: TreeNode?, _ treeB: TreeNode?) -> Bool {
        if treeA == nil && treeB == nil {
            return true
        } 
        
        if treeA != nil && treeB != nil && treeA!.val == treeB!.val {
            return isSameTree(treeA!.left, treeB!.left) && isSameTree(treeA!.right, treeB!.right)
        }
        
        return false
    }
}

