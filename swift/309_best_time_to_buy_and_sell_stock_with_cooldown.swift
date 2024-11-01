class Solution {
  struct State: Hashable {
    var depth: Int
    var canBuy: Bool
  }

  func maxProfit(_ prices: [Int]) -> Int {
    var dp: [State: Int] = [:]

    func dfs(_ depth: Int, _ canBuy: Bool) -> Int {
      if depth >= prices.count {
        return 0
      }

      let state = State(depth: depth, canBuy: canBuy)

      if let profit = dp[state] {
        return profit
      }

      let depth = state.depth
      let canBuy = state.canBuy

      if canBuy == true {
        let profitWhenBuying = dfs(depth + 1, false) - prices[depth]
        let profitWhenCoolDown = dfs(depth + 1, canBuy)
        dp[state] = max(profitWhenBuying, profitWhenCoolDown)
      } else {
        let profitWhenSelling = dfs(depth + 2, true) + prices[depth]
        let profitWhenCoolDown = dfs(depth + 1, canBuy)
        dp[state] = max(profitWhenSelling, profitWhenCoolDown)
      }

      return dp[state]!
    }

    return dfs(0, true)
  }
}
