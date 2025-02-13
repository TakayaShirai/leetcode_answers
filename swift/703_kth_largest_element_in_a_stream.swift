import HeapModule

class KthLargest {

  var heap: Heap<Int>
  let k: Int

  init(_ k: Int, _ nums: [Int]) {
    self.k = k
    self.heap = []

    for num in nums {
      heap.insert(num)

      if heap.count > k {
        heap.removeMin()
      }
    }
  }

  func add(_ val: Int) -> Int {
    heap.insert(val)

    if heap.count > k {
      heap.removeMin()

    }

    return heap.min!
  }
}

/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */
