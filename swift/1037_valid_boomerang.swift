class Solution {
  func isBoomerang(_ points: [[Int]]) -> Bool {
    let x1 = points[0][0]
    let y1 = points[0][1]
    let x2 = points[1][0]
    let y2 = points[1][1]
    let x3 = points[2][0]
    let y3 = points[2][1]

    let determinant = x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2)
    return determinant != 0
  }
}
