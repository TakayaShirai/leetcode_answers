class Solution {
  func maxNumberOfBalloons(_ text: String) -> Int {
    let balloonText: String = "balloon"
    let charCounter: [Character: Int] = createCharCounter(of: text)
    var maxBalloonCnt: Int = Int.max

    for char in balloonText {
      guard let count = charCounter[char] else { return 0 }
      switch char {
      case "b", "a", "n":
        maxBalloonCnt = min(maxBalloonCnt, count)
      case "l", "o":
        maxBalloonCnt = min(maxBalloonCnt, count / 2)
      default:
        continue
      }
    }

    return maxBalloonCnt
  }

  private func createCharCounter(of str: String) -> [Character: Int] {
    var counter: [Character: Int] = [:]

    for char in str {
      counter[char, default: 0] += 1
    }

    return counter
  }
}
