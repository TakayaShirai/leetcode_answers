/// Definition for a binary tree node.
/// public class TreeNode {
///     public var val: Int
///     public var left: TreeNode?
///     public var right: TreeNode?
///     public init() { self.val = 0; self.left = nil; self.right = nil; }
///     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
///     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
///         self.val = val
///         self.left = left
///         self.right = right
///     }
/// }
class Solution {
  func findMode(_ root: TreeNode?) -> [Int] {
    // Morris Traversal
    guard let root = root else { return [] }

    var curStreak: Int = 0
    var maxStreak: Int = 0
    var curNum: Int = 0
    var modes: [Int] = []

    var curNode: TreeNode? = root

    while curNode != nil {
      if curNode!.left != nil {
        var friend: TreeNode? = curNode!.left

        while friend?.right != nil {
          friend = friend?.right
        }

        friend?.right = curNode

        var left: TreeNode? = curNode!.left
        curNode!.left = nil
        curNode = left
      } else {
        let curVal: Int = curNode!.val

        if curVal == curNum {
          curStreak += 1
        } else {
          curStreak = 1
          curNum = curVal
        }

        if curStreak > maxStreak {
          maxStreak = max(maxStreak, curStreak)
          modes = [curVal]
        } else if curStreak == maxStreak {
          modes.append(curVal)
        }

        curNode = curNode!.right
      }
    }

    return modes

    // Inorder DFS
    // guard let root = root else { return [] }

    // var modes: [Int] = []
    // var curNum: Int = root.val
    // var curStreak: Int = 0
    // var maxStreak: Int = 0

    // dfs(root, modes: &modes, curNum: &curNum, curStreak: &curStreak, maxStreak: &maxStreak)

    // return modes

    // Brute Force
    // guard let root = root else { return [] }

    // var numToCntMap: [Int : Int] = [:]
    // var queue: [TreeNode] = [root]
    // var maxCount: Int = 0
    // var res: [Int] = []

    // while !queue.isEmpty {
    //     let curNode: TreeNode = queue.removeFirst()

    //     numToCntMap[curNode.val, default: 0] += 1

    //     if curNode.left != nil {
    //         queue.append(curNode.left!)
    //     }

    //     if curNode.right != nil {
    //         queue.append(curNode.right!)
    //     }

    //     maxCount = max(maxCount, numToCntMap[curNode.val]!)
    // }

    // for (key, value) in numToCntMap {
    //     if value == maxCount {
    //         res.append(key)
    //     }
    // }

    // return res
  }

  private func dfs(
    _ node: TreeNode?, modes: inout [Int], curNum: inout Int, curStreak: inout Int,
    maxStreak: inout Int
  ) {
    guard let node = node else { return }

    dfs(node.left, modes: &modes, curNum: &curNum, curStreak: &curStreak, maxStreak: &maxStreak)

    if node.val == curNum {
      curStreak += 1
    } else {
      curStreak = 1
      curNum = node.val
    }

    if curStreak > maxStreak {
      maxStreak = curStreak
      modes = [node.val]
    } else if curStreak == maxStreak {
      modes.append(node.val)
    }

    dfs(node.right, modes: &modes, curNum: &curNum, curStreak: &curStreak, maxStreak: &maxStreak)
  }
}
