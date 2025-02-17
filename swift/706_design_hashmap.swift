class ListNode {
  var key: Int
  var val: Int
  var next: ListNode?

  init(_ key: Int, _ val: Int) {
    self.key = key
    self.val = val
  }
}

class MyHashMap {

  let hashMapSize: Int = 10000
  var hashMap: [ListNode?]

  init() {
    hashMap = Array(repeating: nil, count: hashMapSize)
  }

  func put(_ key: Int, _ value: Int) {
    let hashedKey: Int = key % hashMapSize
    var curNode: ListNode? = hashMap[hashedKey]

    if curNode == nil {
      hashMap[hashedKey] = ListNode(key, value)
      return
    }

    while curNode != nil {
      if curNode!.key == key {
        curNode!.val = value
        return
      }

      if curNode!.next == nil {
        curNode!.next = ListNode(key, value)
      }

      curNode = curNode!.next
    }
  }

  func get(_ key: Int) -> Int {
    let hashedKey: Int = key % hashMapSize
    var curNode: ListNode? = hashMap[hashedKey]

    while curNode != nil {
      if curNode!.key == key {
        return curNode!.val
      }

      curNode = curNode!.next
    }

    return -1
  }

  func remove(_ key: Int) {
    let hashedKey: Int = key % hashMapSize
    var curNode: ListNode? = hashMap[hashedKey]
    var prevNode: ListNode? = nil

    while curNode != nil {
      let nextNode: ListNode? = curNode!.next

      if curNode!.key == key {
        if prevNode == nil {
          hashMap[hashedKey] = nextNode
        } else {
          prevNode!.next = nextNode
        }
        return
      }

      prevNode = curNode
      curNode = nextNode
    }
  }
}

/**
 * Your MyHashMap object will be instantiated and called as such:
 * let obj = MyHashMap()
 * obj.put(key, value)
 * let ret_2: Int = obj.get(key)
 * obj.remove(key)
 */
