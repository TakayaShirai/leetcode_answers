class Solution {
  func imageSmoother(_ img: [[Int]]) -> [[Int]] {
    var smoothedImg: [[Int]] = img

    for row in 0..<img.count {
      for col in 0..<img[0].count {
        smoothedImg[row][col] = smoothImgCell(originalImage: img, row: row, col: col)
      }
    }

    return smoothedImg
  }

  private func smoothImgCell(originalImage: [[Int]], row: Int, col: Int) -> Int {
    var imgValTotal: Int = 0
    var imgCnt: Int = 0

    for r in (row - 1)...(row + 1) where (0 <= r && r < originalImage.count) {
      for c in (col - 1)...(col + 1) where (0 <= c && c < originalImage[0].count) {
        imgValTotal += originalImage[r][c]
        imgCnt += 1
      }
    }

    return imgValTotal / imgCnt
  }
}
