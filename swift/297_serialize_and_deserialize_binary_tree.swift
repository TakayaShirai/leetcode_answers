/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Codec {
  func serialize(_ root: TreeNode?) -> String {
    guard let root else { return "null" }
    let leftStr: String = serialize(root.left)
    let rightStr: String = serialize(root.right)
    return String(root.val) + "," + leftStr + "," + rightStr
  }

  func deserialize(_ data: String) -> TreeNode? {
    var components = data.split(separator: ",").map { String($0) }
    return buildTree(from: &components)
  }

  private func buildTree(from components: inout [String]) -> TreeNode? {
    guard !components.isEmpty else { return nil }

    let valStr = components.removeFirst()
    guard valStr != "null", let val = Int(valStr) else { return nil }

    let node = TreeNode(val)

    node.left = buildTree(from: &components)
    node.right = buildTree(from: &components)

    return node
  }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))
