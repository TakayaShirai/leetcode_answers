class Solution {
  func countArrangement(_ n: Int) -> Int {
    var beautifulArrCnt = 0
    var usedNums = Set<Int>()
    searchValidPermutations(
      maxVal: n, curIdx: 1, usedNums: &usedNums, beautifulArrCnt: &beautifulArrCnt)
    return beautifulArrCnt
  }

  private func searchValidPermutations(
    maxVal: Int, curIdx: Int, usedNums: inout Set<Int>, beautifulArrCnt: inout Int
  ) {
    if curIdx > maxVal {
      beautifulArrCnt += 1
      return
    }

    for num in 1...maxVal {
      guard !usedNums.contains(num) else { continue }
      guard num % curIdx == 0 || curIdx % num == 0 else { continue }

      usedNums.insert(num)
      searchValidPermutations(
        maxVal: maxVal, curIdx: curIdx + 1, usedNums: &usedNums, beautifulArrCnt: &beautifulArrCnt)
      usedNums.remove(num)
    }
  }
}
