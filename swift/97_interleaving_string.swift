class Solution {

  struct State: Hashable {
    let s1Pos: Int
    let s2Pos: Int
  }

  func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
    guard s1.count + s2.count == s3.count else { return false }

    let arrayS1 = Array(s1)
    let arrayS2 = Array(s2)
    let arrayS3 = Array(s3)

    var dp: [State: Bool] = [:]

    func dfs(_ s1Pos: Int, _ s2Pos: Int) -> Bool {
      if s1Pos == s1.count && s2Pos == s2.count {
        return true
      }

      let state = State(s1Pos: s1Pos, s2Pos: s2Pos)

      if let cachedValue = dp[state] {
        return cachedValue
      }

      dp[state] = false
      if s1Pos < s1.count && arrayS1[s1Pos] == arrayS3[s1Pos + s2Pos] {
        dp[state] = dfs(s1Pos + 1, s2Pos)
      }

      if dp[state]! == false && s2Pos < s2.count && arrayS2[s2Pos] == arrayS3[s1Pos + s2Pos] {
        dp[state] = dfs(s1Pos, s2Pos + 1)
      }

      return dp[state]!
    }

    return dfs(0, 0)
  }
}
