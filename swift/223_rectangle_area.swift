class Solution {
  func computeArea(
    _ ax1: Int, _ ay1: Int, _ ax2: Int, _ ay2: Int, _ bx1: Int, _ by1: Int, _ bx2: Int, _ by2: Int
  ) -> Int {
    let aRecArea: Int = (ax2 - ax1) * (ay2 - ay1)
    let bRecArea: Int = (bx2 - bx1) * (by2 - by1)

    var dupArea: Int = 0

    var dupAreaWidth: Int = 0
    var dupAreaHeight: Int = 0

    if !(ax2 < bx1 || bx2 < ax1) {
      dupAreaWidth = min(ax2, bx2) - max(ax1, bx1)
    }

    if !(ay2 < by1 || by2 < ay1) {
      dupAreaHeight = min(ay2, by2) - max(ay1, by1)
    }

    dupArea = dupAreaWidth * dupAreaHeight

    return aRecArea + bRecArea - dupArea
  }
}
