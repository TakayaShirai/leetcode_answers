class Solution {
  func removeDuplicates(_ nums: inout [Int]) -> Int {
    let allowableDuplicateCnt: Int = 2

    var curIdx: Int = 0

    for num in nums {
      if curIdx < allowableDuplicateCnt || nums[curIdx - allowableDuplicateCnt] != num {
        nums[curIdx] = num
        curIdx += 1
      }
    }

    return curIdx

    // var prevNum: Int = nums[0]
    // var curNumCnt: Int = 0
    // var curIdx: Int = 0
    // var originalNumsCnt: Int = nums.count
    // var deleteCnt: Int = 0

    // while curIdx < nums.count {
    //     let curNum: Int = nums[curIdx]

    //     if curNum == prevNum {
    //         if curNumCnt == 2 {
    //             deleteCnt += 1
    //             nums.remove(at: curIdx)
    //         } else {
    //             curNumCnt += 1
    //             curIdx += 1
    //         }
    //     } else {
    //         prevNum = curNum
    //         curIdx += 1
    //         curNumCnt = 1
    //     }
    // }

    // return originalNumsCnt - deleteCnt
  }
}
