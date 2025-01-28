class Solution {
  func removeDuplicates(_ nums: inout [Int]) -> Int {
    let allowableDuplicateCnt: Int = 1
    var curIdx: Int = 0

    for num in nums {
      if curIdx < allowableDuplicateCnt || nums[curIdx - allowableDuplicateCnt] != num {
        nums[curIdx] = num
        curIdx += 1
      }
    }

    return curIdx

    // O(n^2)
    // var curIdx: Int = 0

    // while curIdx < nums.count {
    //     if curIdx != 0 && nums[curIdx] == nums[curIdx - 1] {
    //         nums.remove(at: curIdx)
    //     } else {
    //         curIdx += 1
    //     }
    // }

    // return nums.count

    // O(n)
    // var left: Int = 0

    // for right in 0..<nums.count {
    //     if nums[left] != nums[right] {
    //         left += 1
    //         nums[left] = nums[right]
    //     }
    // }

    // for _ in 0..<(nums.count - left - 1) {
    //     nums.removeLast()
    // }

    // return nums.count
  }
}
