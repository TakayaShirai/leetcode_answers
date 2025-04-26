class Solution {
  func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var curCombs: [[Int]] = []
    var curComb: [Int] = []
    var curSum: Int = 0
    backtrack(
      cand: candidates, target: target, curCombs: &curCombs, curSum: curSum, curIdx: 0,
      curComb: &curComb)
    return curCombs
  }

  private func backtrack(
    cand: [Int], target: Int, curCombs: inout [[Int]], curSum: Int, curIdx: Int,
    curComb: inout [Int]
  ) {
    guard curSum != target else {
      curCombs.append(curComb)
      return
    }

    guard curSum <= target && curIdx < cand.count else {
      return
    }

    curComb.append(cand[curIdx])
    backtrack(
      cand: cand, target: target, curCombs: &curCombs, curSum: curSum + cand[curIdx],
      curIdx: curIdx, curComb: &curComb)
    curComb.removeLast()

    backtrack(
      cand: cand, target: target, curCombs: &curCombs, curSum: curSum, curIdx: curIdx + 1,
      curComb: &curComb)
  }
}
