class Solution {
  func rotateString(_ s: String, _ goal: String) -> Bool {
    guard s.count == goal.count else { return false }
    let doubledString: String = s + s
    return doubledString.contains(goal)
  }
}
