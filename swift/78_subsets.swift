class Solution {
  func subsets(_ nums: [Int]) -> [[Int]] {
    var res: [[Int]] = []
    var subset: [Int] = []

    func dfs(_ index: Int) {
      if index == nums.count {
        res.append(subset)
        return
      }

      subset.append(nums[index])
      dfs(index + 1)

      subset.removeLast()
      dfs(index + 1)
    }

    dfs(0)
    return res
  }
}
