import HeapModule

class Solution {
  func thirdMax(_ nums: [Int]) -> Int {
    // Greedy?
    var firstMax: Int? = nil
    var secondMax: Int? = nil
    var thirdMax: Int? = nil

    for num in nums {
      if num == firstMax || num == secondMax || num == thirdMax { continue }

      if firstMax == nil || firstMax! < num {
        thirdMax = secondMax
        secondMax = firstMax
        firstMax = num
      } else if secondMax == nil || secondMax! < num {
        thirdMax = secondMax
        secondMax = num
      } else if thirdMax == nil || thirdMax! < num {
        thirdMax = num
      }
    }

    return thirdMax != nil ? thirdMax! : firstMax!

    // Heap
    // var setNums: Set<Int> = Set(nums)

    // guard setNums.count >= 3 else {
    //     var maxNum: Int = Int.min

    //     for num in setNums {
    //         maxNum = max(maxNum, num)
    //     }

    //     return maxNum
    // }

    // var numsHeap: Heap<Int> = Heap(setNums)
    // var thirdMaxNum: Int = 0

    // for _ in 0..<3 {
    //     thirdMaxNum = numsHeap.popMax()!
    // }

    // return thirdMaxNum

    // Sort
    // let sortedNums: [Int] = nums.sorted().reversed()
    // var count: Int = 1
    // var curIdx: Int = 0

    // while curIdx < nums.count - 1 && count < 3 {
    //     if sortedNums[curIdx] != sortedNums[curIdx + 1] {
    //         count += 1
    //     }

    //     curIdx += 1
    // }

    // return count == 3 ? sortedNums[curIdx] : sortedNums[0]
  }
}
