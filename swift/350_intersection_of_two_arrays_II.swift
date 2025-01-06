class Solution {
  func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    let sortedNums1: [Int] = nums1.sorted()
    let sortedNums2: [Int] = nums2.sorted()

    var nums1Idx: Int = 0
    var nums2Idx: Int = 0

    var intersections: [Int] = []

    while nums1Idx < nums1.count && nums2Idx < nums2.count {
      let num1: Int = sortedNums1[nums1Idx]
      let num2: Int = sortedNums2[nums2Idx]

      if num1 < num2 {
        nums1Idx += 1
      } else if num2 < num1 {
        nums2Idx += 1
      } else {
        intersections.append(num1)
        nums1Idx += 1
        nums2Idx += 1
      }
    }

    return intersections

    // var nums1Map: [Int : Int] = createIntCntMap(nums1)
    // var nums2Map: [Int : Int] = createIntCntMap(nums2)

    // var intersections: [Int] = []

    // for (num1, num1Cnt) in nums1Map {
    //     if let num2Cnt = nums2Map[num1] {
    //         let smallerCnt: Int = min(num1Cnt, num2Cnt)

    //         for _ in 0..<smallerCnt {
    //             intersections.append(num1)
    //         }
    //     }
    // }

    // return intersections
  }

  private func createIntCntMap(_ nums: [Int]) -> [Int: Int] {
    var map: [Int: Int] = [:]

    for num in nums {
      map[num, default: 0] += 1
    }

    return map
  }
}
