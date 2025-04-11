class Solution {
  func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    // O(n)
    var left: Int = 0

    for right in 0..<nums.count {
      if nums[right] != val {
        nums[left] = nums[right]
        left += 1
      }
    }

    return left

    // var curIdx: Int = 0
    // var swapIdx: Int = nums.count - 1

    // while curIdx <= swapIdx {
    //   let curNum: Int = nums[curIdx]

    //   guard curNum != val else {
    //     let tmp: Int = nums[swapIdx]
    //     nums[swapIdx] = curNum
    //     nums[curIdx] = tmp
    //     nums.removeLast()
    //     swapIdx -= 1
    //     continue
    //   }

    //   curIdx += 1
    // }

    // return nums.count

    // O(n^2)
    // var curIdx: Int = 0

    // while curIdx < nums.count {
    //   if nums[curIdx] == val {
    //     nums.remove(at: curIdx)
    //   } else {
    //     curIdx += 1
    //   }
    // }

    // return nums.count
  }
}
