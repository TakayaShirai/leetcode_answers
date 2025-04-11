class Solution {
  func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var fillIdx: Int = n + m - 1
    var nums1Idx: Int = m - 1
    var nums2Idx: Int = n - 1

    while nums1Idx >= 0 || nums2Idx >= 0 {
      let curNums1Num: Int = nums1Idx >= 0 ? nums1[nums1Idx] : Int.min
      let curNums2Num: Int = nums2Idx >= 0 ? nums2[nums2Idx] : Int.min

      if curNums1Num > curNums2Num {
        nums1[fillIdx] = curNums1Num
        nums1Idx -= 1
      } else {
        nums1[fillIdx] = curNums2Num
        nums2Idx -= 1
      }

      fillIdx -= 1
    }
  }
}
