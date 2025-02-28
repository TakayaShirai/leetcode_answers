struct DirectionIterator: IteratorProtocol {
  private let directions: [(row: Int, col: Int)] = [
    (row: 1, col: 0),
    (row: -1, col: 0),
    (row: 0, col: -1),
    (row: 0, col: 1),
  ]
  private var curIdx: Int = 0

  mutating func next() -> (row: Int, col: Int)? {
    guard curIdx < directions.count else { return nil }
    let direction = directions[curIdx]
    curIdx += 1
    return direction
  }
}

class Solution {
  func numIslands(_ grid: [[Character]]) -> Int {
    var seenLands: [[Bool]] = Array(
      repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
    var islandCnt: Int = 0

    for row in 0..<grid.count {
      for col in 0..<grid[0].count {
        if grid[row][col] == "1" && !seenLands[row][col] {
          print(row, col)
          findLands(from: (row, col), grid: grid, seenLands: &seenLands)
          islandCnt += 1
        }
      }
    }

    return islandCnt
  }

  private func findLands(
    from pos: (row: Int, col: Int), grid: [[Character]], seenLands: inout [[Bool]]
  ) {
    var landQueue: [(row: Int, col: Int)] = []
    landQueue.append(pos)

    while !landQueue.isEmpty {
      let curLandPos = landQueue.removeFirst()
      let curRow: Int = curLandPos.row
      let curCol: Int = curLandPos.col

      var directionIterator = DirectionIterator()

      while let direction = directionIterator.next() {
        let newRow: Int = curRow + direction.row
        let newCol: Int = curCol + direction.col

        guard 0 <= newRow && newRow < grid.count && 0 <= newCol && newCol < grid[0].count else {
          continue
        }

        if grid[newRow][newCol] == "1" && !seenLands[curRow][curCol] {
          landQueue.append((newRow, newCol))
        }
      }

      seenLands[curRow][curCol] = true
    }
  }
}
