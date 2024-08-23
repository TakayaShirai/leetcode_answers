class KthLargest {
  private var k: Int
  private var topKNums: [Int]

  init(_ k: Int, _ nums: [Int]) {
    self.k = k
    topKNums = nums
    topKNums.sort()

    while topKNums.count > k {
      topKNums.removeFirst()
    }
  }

  func add(_ val: Int) -> Int {
    if topKNums.count < k {
      insert(val)
    } else if topKNums.first! < val {
      topKNums.removeFirst()
      insert(val)
    }

    return topKNums.first!
  }

  func insert(_ val: Int) {
    var left: Int = 0
    var right: Int = topKNums.count - 1
    var mid: Int = (left + right) / 2

    while left <= right {
      mid = (left + right) / 2

      if topKNums[mid] == val {
        left = mid
        break
      } else if topKNums[mid] < val {
        left = mid + 1
      } else {
        right = mid - 1
      }
    }

    topKNums.insert(val, at: left)
  }
}

/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */
