class Solution {
  func generateParenthesis(_ n: Int) -> [String] {
    var res: [String] = []

    func backtrack(_ openCount: Int, _ closedCount: Int, _ comb: String) {
      if openCount == n && closedCount == n {
        res.append(comb)
        return
      }

      if openCount < n {
        backtrack(openCount + 1, closedCount, comb + "(")
      }

      if openCount > closedCount {
        backtrack(openCount, closedCount + 1, comb + ")")
      }
    }

    backtrack(0, 0, "")

    return res
  }
}
