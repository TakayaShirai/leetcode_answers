struct DirectionsIterator: IteratorProtocol {
  private let directions: [(row: Int, col: Int)] = [
    (row: -1, col: 0),
    (row: 1, col: 0),
    (row: 0, col: 1),
    (row: 0, col: -1),
  ]

  private var curIdx: Int = 0

  mutating func next() -> (row: Int, col: Int)? {
    guard curIdx < directions.count else {
      return nil
    }
    let direction = directions[curIdx]
    curIdx += 1
    return direction
  }
}

class Solution {
  func allCellsDistOrder(_ rows: Int, _ cols: Int, _ rCenter: Int, _ cCenter: Int) -> [[Int]] {
    var sortedCells: [[Int]] = []
    var seenCells: [[Bool]] = Array(repeating: Array(repeating: false, count: cols), count: rows)
    var cellsQueue: [[Int]] = [[rCenter, cCenter]]
    seenCells[rCenter][cCenter] = true

    while !cellsQueue.isEmpty {
      let curCell: [Int] = cellsQueue.removeFirst()
      let curRow: Int = curCell[0]
      let curCol: Int = curCell[1]

      sortedCells.append(curCell)

      var directionsIterator = DirectionsIterator()
      while let direction = directionsIterator.next() {
        let newRow: Int = curCell[0] + direction.row
        let newCol: Int = curCell[1] + direction.col

        guard isSeen(row: newRow, col: newCol, rows: rows, cols: cols, seenCells: seenCells) else {
          continue
        }

        cellsQueue.append([newRow, newCol])
        seenCells[newRow][newCol] = true
      }
    }

    return sortedCells
  }

  private func isSeen(row: Int, col: Int, rows: Int, cols: Int, seenCells: [[Bool]]) -> Bool {
    return 0 <= row && row < rows && 0 <= col && col < cols && !seenCells[row][col]
  }
}
