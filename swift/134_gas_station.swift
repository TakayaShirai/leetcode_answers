class Solution {
  func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    guard gas.total >= cost.total else { return -1 }
    var curTotalGas: Int = 0
    var startIdx: Int = 0

    for (curIdx, curGas) in gas.enumerated() {
      curTotalGas += curGas

      guard curTotalGas >= cost[curIdx] else {
        curTotalGas = 0
        startIdx = curIdx + 1
        continue
      }

      curTotalGas -= cost[curIdx]
    }

    return startIdx
  }
}

extension Array where Element == Int {
  var total: Int {
    self.reduce(0, +)
  }
}
