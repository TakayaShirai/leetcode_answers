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
    func maxDepth(_ root: TreeNode?) -> Int {
        return iterativeDfsMaxDepth(root)
        // return recursiveDfsMaxDepth(root)
        // return bfsMaxDepth(root)
    }
    
    func recursiveDfsMaxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        return 1 + max(recursiveDfsMaxDepth(root!.left), recursiveDfsMaxDepth(root!.right))
    }
    
    func iterativeDfsMaxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        var maxDepth: Int = 1
        var stack: [(node: TreeNode, depth: Int)] = [(root!, 1)]
        
        while !stack.isEmpty {
            let poppedItem = stack.popLast()!
            var curNode = poppedItem.node
            var curDepth = poppedItem.depth
            
            maxDepth = max(maxDepth, curDepth)
            
            if curNode.right != nil {
                stack.append((curNode.right!, curDepth + 1))
            }
            
            if curNode.left != nil {
                stack.append((curNode.left!, curDepth + 1))
            }
        }
        
        
        return maxDepth
    }
    
    func bfsMaxDepth(_ root: TreeNode?) -> Int {
        guard var cur = root else {return 0}
        
        var depth: Int = 0
        var queue: [TreeNode] = [cur]
        
        while !queue.isEmpty {
            var tmpCount = queue.count
            depth += 1
            
            for _ in 0..<tmpCount {
                cur = queue.removeFirst()
                if cur.left != nil {
                    queue.append(cur.left!)
                }
            
                if cur.right != nil {
                    queue.append(cur.right!) 
                }
            }
        }
        
        return depth
    }
}

