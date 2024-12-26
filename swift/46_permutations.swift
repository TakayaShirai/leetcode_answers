class Solution {
  func permute(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 0 else { return [[]] }

    var perms: [[Int]] = permute(Array(nums[1...]))
    var resPerms: [[Int]] = []

    for perm in perms {
      for i in 0...perm.count {
        var curPerm = perm
        curPerm.insert(nums[0], at: i)
        resPerms.append(curPerm)
      }
    }

    return resPerms
  }
}
