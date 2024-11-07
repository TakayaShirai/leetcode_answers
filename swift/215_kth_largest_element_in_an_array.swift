import HeapModule

class Solution {
  func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    //         let k = nums.count - k
    //         var nums = nums

    //         func quickSelect(_ left: Int, _ right: Int) -> Int {
    //             let pivotNum = nums[right]
    //             var p = left

    //             for i in left..<right {
    //                 if nums[i] <= pivotNum {
    //                     nums.swapAt(i, p)
    //                     p += 1
    //                 }
    //             }

    //             nums.swapAt(p, right)

    //             if p > k {
    //                 return quickSelect(left, p - 1)
    //             } else if p < k {
    //                 return quickSelect(p + 1, right)
    //             } else {
    //                 return nums[p]
    //             }
    //         }

    //         return quickSelect(0, nums.count-1)

    var heap: Heap<Int> = []
    for num in nums {
      heap.insert(num)
      if heap.count > k {
        heap.popMin()
      }
    }
    return heap.min!

  }
}
