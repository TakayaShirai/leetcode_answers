class Solution {
  static let directions: [(row: Int, col: Int)] = [
    (row: -1, col: 0),  // Up
    (row: 1, col: 0),  // Down
    (row: 0, col: 1),  // Right
    (row: 0, col: -1),  // Left
  ]

  func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
    guard image[sr][sc] != color else { return image }

    let originalColor: Int = image[sr][sc]
    var curImage: [[Int]] = image
    var imageCellsQueue: [(row: Int, col: Int)] = []
    imageCellsQueue.append((sr, sc))
    curImage[sr][sc] = color

    while !imageCellsQueue.isEmpty {
      let curCell = imageCellsQueue.removeFirst()

      var directionIterator = Solution.directions.makeIterator()

      while let direction = directionIterator.next() {
        let nextCellRow: Int = curCell.row + direction.row
        let nextCellCol: Int = curCell.col + direction.col

        guard
          0 <= nextCellRow && nextCellRow < image.count
            && 0 <= nextCellCol && nextCellCol < image[0].count
        else {
          continue
        }

        if curImage[nextCellRow][nextCellCol] == originalColor {
          curImage[nextCellRow][nextCellCol] = color
          imageCellsQueue.append((nextCellRow, nextCellCol))
        }
      }
    }

    return curImage
  }
}
