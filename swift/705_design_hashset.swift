class ListNode {
  var val: Int
  var next: ListNode?

  init(_ val: Int) {
    self.val = val
  }
}

class MyHashSet {

  var hashSet: [ListNode?]
  let hashSetSize: Int = 10000

  init() {
    hashSet = Array(repeating: nil, count: hashSetSize)
  }

  func add(_ key: Int) {
    let hashedKey: Int = key % hashSetSize
    var curNode: ListNode? = hashSet[hashedKey]

    if curNode == nil {
      hashSet[hashedKey] = ListNode(key)
      return
    }

    while curNode != nil {
      guard curNode!.val != key else { return }

      if curNode!.next == nil {
        curNode!.next = ListNode(key)
        return
      }

      curNode = curNode!.next
    }
  }

  func remove(_ key: Int) {
    let hashedKey: Int = key % hashSetSize
    var curNode: ListNode? = hashSet[hashedKey]
    var prevNode: ListNode? = nil

    while curNode != nil {
      let nextNode = curNode!.next

      if curNode!.val == key {
        if prevNode == nil {
          hashSet[hashedKey] = nextNode
        } else {
          prevNode?.next = nextNode
        }

        return
      }

      prevNode = curNode
      curNode = nextNode
    }
  }

  func contains(_ key: Int) -> Bool {
    let hashedKey: Int = key % hashSetSize
    var curNode: ListNode? = hashSet[hashedKey]

    while curNode != nil {
      if curNode!.val == key {
        return true
      }

      curNode = curNode!.next
    }

    return false
  }
}

/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */
