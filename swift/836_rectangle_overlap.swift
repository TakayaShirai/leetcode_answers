class Solution {
  func isRectangleOverlap(_ rec1: [Int], _ rec2: [Int]) -> Bool {
    return isHorizontallyOverlap(rec1, rec2) && isVerticallyOverlap(rec1, rec2)
  }

  private func isHorizontallyOverlap(_ rec1: [Int], _ rec2: [Int]) -> Bool {
    let rec1X1: Int = rec1[0]
    let rec1X2: Int = rec1[2]

    let rec2X1: Int = rec2[0]
    let rec2X2: Int = rec2[2]

    return !(rec1X2 <= rec2X1 || rec1X1 >= rec2X2)
  }

  private func isVerticallyOverlap(_ rec1: [Int], _ rec2: [Int]) -> Bool {
    let rec1Y1: Int = rec1[1]
    let rec1Y2: Int = rec1[3]

    let rec2Y1: Int = rec2[1]
    let rec2Y2: Int = rec2[3]

    return !(rec1Y2 <= rec2Y1 || rec1Y1 >= rec2Y2)
  }
}
