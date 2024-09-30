class Solution {
  func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    let setWordDict = Set(wordDict)
    let arrayS = Array(s)

    var dp = Array(repeating: false, count: s.count + 1)
    dp[s.count] = true

    for i in (0..<s.count).reversed() {
      for word in setWordDict {
        if i + word.count <= s.count && String(arrayS[i...(i + word.count - 1)]) == word {
          dp[i] = dp[i + word.count]
        }

        if dp[i] == true {
          break
        }
      }
    }

    return dp[0]
  }
}
