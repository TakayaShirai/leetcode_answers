class Solution {
  func subsets(_ nums: [Int]) -> [[Int]] {
    var subsets: [[Int]] = []

    dfs(depth: 0, nums, curSubset: [], subsets: &subsets)
    return subsets
  }

  private func dfs(depth: Int, _ nums: [Int], curSubset: [Int], subsets: inout [[Int]]) {
    if depth == nums.count {
      subsets.append(curSubset)
      return
    }

    var subset = curSubset
    subset.append(nums[depth])
    dfs(depth: depth + 1, nums, curSubset: subset, subsets: &subsets)

    subset.removeLast()
    dfs(depth: depth + 1, nums, curSubset: subset, subsets: &subsets)
  }
}
