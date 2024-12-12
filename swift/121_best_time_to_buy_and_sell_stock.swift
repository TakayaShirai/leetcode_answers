class Solution {
  func maxProfit(_ prices: [Int]) -> Int {
    var maxProfit: Int = 0
    var buyIdx: Int = 0
    var sellIdx: Int = 1

    while sellIdx < prices.count {
      let buyPrice: Int = prices[buyIdx]
      let sellPrice: Int = prices[sellIdx]
      let profit: Int = sellPrice - buyPrice

      if profit < 0 {
        buyIdx = sellIdx
        sellIdx = buyIdx + 1
      } else {
        maxProfit = max(maxProfit, profit)
        sellIdx += 1
      }
    }

    return maxProfit
  }
}
