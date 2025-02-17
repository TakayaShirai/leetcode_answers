class Solution {
  func flipAndInvertImage(_ image: [[Int]]) -> [[Int]] {
    var curImage: [[Int]] = image
    var left: Int = 0
    var right: Int = curImage[0].count - 1

    for row in 0..<curImage.count {
      while left <= right {
        let tmp: Int = curImage[row][left]
        curImage[row][left] = curImage[row][right] ^ 1
        curImage[row][right] = tmp ^ 1

        left += 1
        right -= 1
      }

      left = 0
      right = curImage[0].count - 1
    }

    return curImage
  }
}
