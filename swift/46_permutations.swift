class Solution {
  func permute(_ nums: [Int]) -> [[Int]] {
    var perms: [[Int]] = []
    var curPerm: [Int] = []
    backtrack(nums: nums, perms: &perms, curPerm: &curPerm)
    return perms
  }

  private func backtrack(nums: [Int], perms: inout [[Int]], curPerm: inout [Int]) {
    guard curPerm.count != nums.count else {
      perms.append(Array(curPerm))
      return
    }

    for num in nums {
      guard !curPerm.contains(num) else { continue }
      curPerm.append(num)
      backtrack(nums: nums, perms: &perms, curPerm: &curPerm)
      curPerm.removeLast()
    }
  }
}
