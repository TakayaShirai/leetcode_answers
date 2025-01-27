class Solution {
  func combine(_ n: Int, _ k: Int) -> [[Int]] {
    var allPossibleComb: [[Int]] = []
    backtrack(maxNum: n, combCnt: k, curNum: 1, curComb: [], allPossibleComb: &allPossibleComb)
    return allPossibleComb
  }

  private func backtrack(
    maxNum: Int, combCnt: Int, curNum: Int, curComb: [Int], allPossibleComb: inout [[Int]]
  ) {
    guard curComb.count != combCnt else {
      allPossibleComb.append(curComb)
      return
    }

    guard curNum <= maxNum else { return }

    var comb = curComb
    comb.append(curNum)
    backtrack(
      maxNum: maxNum, combCnt: combCnt, curNum: curNum + 1, curComb: comb,
      allPossibleComb: &allPossibleComb)

    comb.removeLast()
    backtrack(
      maxNum: maxNum, combCnt: combCnt, curNum: curNum + 1, curComb: comb,
      allPossibleComb: &allPossibleComb)
  }
}
