class Solution {
  func findLUSlength(_ a: String, _ b: String) -> Int {
    // Simple
    if a == b {
      return -1
    } else {
      return max(a.count, b.count)
    }

    // Brute Force (Time Limit Exceeded) O(2^n)
    // let aSubsequences: [String] = createSubsequences(a)
    // let bSubsequences: [String] = createSubsequences(b)

    // var maxLen: Int = -1

    // for subsequence in aSubsequences {
    //     if !bSubsequences.contains(subsequence) {
    //         maxLen = max(maxLen, subsequence.count)
    //     }
    // }

    // for subsequence in bSubsequences {
    //     if !aSubsequences.contains(subsequence) {
    //         maxLen = max(maxLen, subsequence.count)
    //     }
    // }

    // return maxLen
  }

  private func createSubsequences(_ str: String) -> [String] {
    var subsequences: [String] = []
    dfs(0, str, [], &subsequences)
    return subsequences
  }

  private func dfs(
    _ depth: Int, _ str: String, _ subsequence: [Character], _ subsequences: inout [String]
  ) {
    if depth == str.count {
      subsequences.append(String(subsequence))
      return
    }

    let inputChar: [Character] = Array(str)
    var curSubsequence: [Character] = subsequence

    curSubsequence.append(inputChar[depth])
    dfs(depth + 1, str, curSubsequence, &subsequences)

    curSubsequence.removeLast()
    dfs(depth + 1, str, curSubsequence, &subsequences)
  }
}
