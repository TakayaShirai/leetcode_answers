class Solution {
  func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    let sortedNums1: [Int] = nums1.sorted()
    let sortedNums2: [Int] = nums2.sorted()

    var intersections: [Int] = []

    var nums1Idx: Int = 0
    var nums2Idx: Int = 0

    while nums1Idx < nums1.count && nums2Idx < nums2.count {
      let curNum1: Int = sortedNums1[nums1Idx]
      let curNum2: Int = sortedNums2[nums2Idx]

      if curNum1 < curNum2 {
        nums1Idx += 1
      } else if curNum2 < curNum1 {
        nums2Idx += 1
      } else {
        intersections.append(curNum1)

        while nums1Idx < nums1.count && nums2Idx < nums2.count
          && sortedNums1[nums1Idx] == curNum1
          && sortedNums1[nums1Idx] == sortedNums2[nums2Idx]
        {
          nums1Idx += 1
          nums2Idx += 1
        }
      }
    }

    return intersections

    // var num1IntCntMap: [Int : Int] = createIntCntMap(nums1)
    // var intersections: Set<Int> = []

    // for num in nums2 {
    //     if let intersection = num1IntCntMap[num] {
    //         intersections.insert(num)
    //     }
    // }

    // return Array(intersections)
  }

  private func createIntCntMap(_ nums: [Int]) -> [Int: Int] {
    var map: [Int: Int] = [:]

    for num in nums {
      map[num, default: 0] += 1
    }

    return map
  }
}
