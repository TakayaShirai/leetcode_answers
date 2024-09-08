class Solution {
  func permute(_ nums: [Int]) -> [[Int]] {
    if nums.count == 0 {
      return [[]]
    }

    let perms = permute(Array(nums[1...]))
    var res: [[Int]] = []

    for perm in perms {
      for i in 0...perm.count {
        var curPerm = perm
        curPerm.insert(nums[0], at: i)
        res.append(curPerm)
      }
    }

    return res
  }
}
