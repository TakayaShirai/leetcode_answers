class Solution {
  func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
    var allCombs: [[Int]] = []
    var curComb: [Int] = []
    backtrack(allCombs: &allCombs, curComb: &curComb, numsCnt: k, start: 1, remaining: n)
    return allCombs
  }

  private func backtrack(
    allCombs allCombs: inout [[Int]],
    curComb curComb: inout [Int],
    numsCnt numsCnt: Int,
    start start: Int,
    remaining remaining: Int
  ) {
    guard !(curComb.count == numsCnt && remaining == 0) else {
      allCombs.append(curComb)
      return
    }

    guard start <= 9 else { return }

    for num in start...9 {
      curComb.append(num)
      backtrack(
        allCombs: &allCombs, curComb: &curComb, numsCnt: numsCnt, start: num + 1,
        remaining: remaining - num)
      curComb.removeLast()
    }
  }
}
