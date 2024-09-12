class Solution {
  func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    let sortedCandidates = candidates.sorted()
    var res: [[Int]] = []

    func backtrack(_ index: Int, _ subset: [Int], _ total: Int) {
      if total == target {
        res.append(subset)
        return
      } else if total > target {
        return
      } else if index == candidates.count {
        return
      }

      var curSubset = subset
      curSubset.append(sortedCandidates[index])
      backtrack(index + 1, curSubset, total + sortedCandidates[index])

      var curIndex = index
      while curIndex + 1 < candidates.count
        && sortedCandidates[curIndex] == sortedCandidates[curIndex + 1]
      {
        curIndex += 1
      }

      backtrack(curIndex + 1, subset, total)
    }

    backtrack(0, [], 0)
    return res
  }
}
