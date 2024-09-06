class Solution {
  func maxDistance(_ colors: [Int]) -> Int {
    var first: Int = 0
    var last: Int = colors.count - 1

    while colors[colors.count - 1] == colors[first] {
      first += 1
    }

    while colors[0] == colors[last] {
      last -= 1
    }

    return max((colors.count - first - 1), last)
  }
}
