class Node {
  var key: Int
  var val: Int
  var next: Node?
  var prev: Node?

  init(_ key: Int, _ value: Int) {
    self.key = key
    self.val = value
  }
}

class LRUCache {
  let capacity: Int
  var hashMap: [Int: Node]
  var left: Node
  var right: Node

  init(_ capacity: Int) {
    self.capacity = capacity
    self.hashMap = [:]
    self.left = Node(0, 0)
    self.right = Node(0, 0)

    self.left.next = self.right
    self.right.prev = self.left
  }

  func remove(_ node: Node) {
    let prev = node.prev!
    let next = node.next!

    prev.next = next
    next.prev = prev
  }

  func insert(_ node: Node) {
    let prev = right.prev!
    prev.next = node
    node.prev = prev
    node.next = right
    right.prev = node
  }

  func get(_ key: Int) -> Int {
    if let node = hashMap[key] {
      remove(node)
      insert(node)
      return node.val
    }

    return -1
  }

  func put(_ key: Int, _ value: Int) {
    if let node = hashMap[key] {
      remove(node)
    }
    hashMap[key] = Node(key, value)
    insert(hashMap[key]!)

    if hashMap.count > capacity {
      let lru = left.next!
      remove(lru)
      hashMap.removeValue(forKey: lru.key)
    }
  }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
