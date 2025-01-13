class Solution {
  func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    // Set
    var seenNums: Set<Int> = []
    var disappearedNums: [Int] = []

    for num in nums {
      seenNums.insert(num)
    }

    for i in 1...nums.count {
      if !seenNums.contains(i) {
        disappearedNums.append(i)
      }
    }

    return disappearedNums

    // Sorting & Binary Search
    // var sortedNums: [Int] = nums.sorted()
    // var disappearedNums: [Int] = []

    // for i in 1...nums.count {
    //     if !isInNums(i, sortedNums) {
    //         disappearedNums.append(i)
    //     }
    // }

    // return disappearedNums

    // Sorting
    // var sortedNums: [Int] = nums.sorted()
    // var disappearedNums: [Int] = []
    // var curNum: Int = 1
    // var curIdx: Int = 0

    // while curIdx < sortedNums.count {
    //     if sortedNums[curIdx] == curNum {
    //         curNum += 1
    //     } else if sortedNums[curIdx] > curNum {
    //         while curNum < sortedNums[curIdx] {
    //             disappearedNums.append(curNum)
    //             curNum += 1
    //         }

    //         curNum += 1
    //     }

    //     curIdx += 1
    // }

    // while curNum <= sortedNums.count {
    //     disappearedNums.append(curNum)
    //     curNum += 1
    // }

    // return disappearedNums
  }

  private func isInNums(_ num: Int, _ nums: [Int]) -> Bool {
    var left: Int = 0
    var right: Int = nums.count - 1

    while left <= right {
      let mid = left + (right - left) / 2

      if nums[mid] == num {
        return true
      } else if nums[mid] > num {
        right = mid - 1
      } else {
        left = mid + 1
      }
    }

    return false
  }
}
