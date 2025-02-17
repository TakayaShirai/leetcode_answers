class Solution {
  func buddyStrings(_ s: String, _ goal: String) -> Bool {
    guard s.count == goal.count else { return false }

    if s == goal {
      // Checks if the string s has duplicates.
      return Set(s).count < s.count
    } else {
      return canSwapExactlyTwoChars(s, goal)
    }
  }

  private func canSwapExactlyTwoChars(_ s: String, _ goal: String) -> Bool {
    let requiredSwapCnt: Int = 2
    var diffChars: [[Character]] = []

    for (sChar, goalChar) in zip(s, goal) {
      if sChar != goalChar {
        diffChars.append([sChar, goalChar])
        guard diffChars.count <= requiredSwapCnt else { return false }
      }
    }

    return diffChars.count == 2 && diffChars[0] == diffChars[1].reversed()
  }
}
