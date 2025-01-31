class Solution {
  func judgeCircle(_ moves: String) -> Bool {
    var x: Int = 0
    var y: Int = 0

    for move in moves {
      switch move {
      case "R":
        x += 1
      case "L":
        x -= 1
      case "U":
        y += 1
      case "D":
        y -= 1
      default:
        continue
      }
    }

    return x == 0 && y == 0
  }
}
