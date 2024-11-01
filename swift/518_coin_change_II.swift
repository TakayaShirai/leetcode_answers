class Solution {
  struct State: Hashable {
    let remain: Int
    let index: Int
  }

  func change(_ amount: Int, _ coins: [Int]) -> Int {
    var dp: [State: Int] = [:]

    func dfs(_ remain: Int, _ index: Int) -> Int {
      if remain == 0 {
        return 1
      } else if remain < 0 || index >= coins.count {
        return 0
      }

      let state = State(remain: remain, index: index)

      if let cachedResult = dp[state] {
        return cachedResult
      }

      dp[state] = dfs(remain - coins[index], index) + dfs(remain, index + 1)

      return dp[state]!
    }

    return dfs(amount, 0)
  }
}
