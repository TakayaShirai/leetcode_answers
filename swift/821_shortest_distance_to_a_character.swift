class Solution {
  func shortestToChar(_ s: String, _ c: Character) -> [Int] {
    var shortestDistances: [Int] = Array(repeating: Int.max, count: s.count)

    for (idx, char) in s.enumerated() {
      if char == c {
        shortestDistances[idx] = 0
      }
    }

    for idx in 1..<s.count {
      guard shortestDistances[idx - 1] != Int.max else { continue }
      shortestDistances[idx] = min(shortestDistances[idx], shortestDistances[idx - 1] + 1)
    }

    for idx in (0..<s.count - 1).reversed() {
      guard shortestDistances[idx + 1] != Int.max else { continue }
      shortestDistances[idx] = min(shortestDistances[idx], shortestDistances[idx + 1] + 1)
    }

    return shortestDistances
  }
}
