class Solution {
  func maxProfit(_ prices: [Int]) -> Int {
    guard prices.count > 1 else { return 0 }

    var curProfit: Int = 0

    for curIdx in 1..<prices.count {
      let prevPrice: Int = prices[curIdx - 1]
      let curPrice: Int = prices[curIdx]
      curProfit += max(0, curPrice - prevPrice)
    }

    return curProfit
  }
}
