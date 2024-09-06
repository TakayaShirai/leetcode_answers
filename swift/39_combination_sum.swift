class Solution {
  func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var res: [[Int]] = []
    var subset: [Int] = []

    func dfs(_ index: Int, _ sum: Int) {
      if sum == target {
        res.append(subset)
        return
      }

      if sum > target || index >= candidates.count {
        return
      }

      subset.append(candidates[index])
      dfs(index, sum + candidates[index])

      subset.removeLast()
      dfs(index + 1, sum)
    }

    dfs(0, 0)
    return res
  }
}
