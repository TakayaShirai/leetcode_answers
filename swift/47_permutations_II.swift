class Solution {
  func permuteUnique(_ nums: [Int]) -> [[Int]] {
    var resPerms: [[Int]] = []
    var curPerm: [Int] = []
    var numsIntCntMap: [Int: Int] = createIntCntMap(nums)

    backtrack(nums, &curPerm, &resPerms, &numsIntCntMap)

    return resPerms
  }

  private func backtrack(
    _ nums: [Int], _ curPerm: inout [Int], _ resPerms: inout [[Int]],
    _ numsIntCntMap: inout [Int: Int]
  ) {
    if curPerm.count == nums.count {
      resPerms.append(curPerm)
      return
    }

    for (key, value) in numsIntCntMap {
      if value > 0 {
        curPerm.append(key)
        numsIntCntMap[key]! -= 1

        backtrack(nums, &curPerm, &resPerms, &numsIntCntMap)

        curPerm.removeLast()
        numsIntCntMap[key]! += 1
      }
    }
  }

  private func createIntCntMap(_ nums: [Int]) -> [Int: Int] {
    var map: [Int: Int] = [:]

    for num in nums {
      map[num, default: 0] += 1
    }

    return map
  }

}
