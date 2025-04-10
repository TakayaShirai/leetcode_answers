public enum FindRockError: Error {
  case noRockFoundError
}

struct DirectionIterator: IteratorProtocol {
  var curIdx: Int = 0
  var directions: [(row: Int, col: Int)] = [
    (-1, 0),
    (1, 0),
    (0, 1),
    (0, -1),
  ]

  mutating func next() -> (row: Int, col: Int)? {
    var tmpIdx: Int = curIdx
    guard curIdx < directions.count else { return nil }
    curIdx += 1
    return directions[tmpIdx]
  }
}

class Solution {
  func numRookCaptures(_ board: [[Character]]) -> Int {
    var pawnsCnt: Int = 0
    var rockRow: Int = 0
    var rockCol: Int = 0

    do {
      let rockPos: (row: Int, col: Int) = try findRock(from: board)
      rockRow = rockPos.row
      rockCol = rockPos.col
    } catch {
      print(error)
    }

    pawnsCnt = countPawns(row: rockRow, col: rockCol, board: board)
    return pawnsCnt
  }

  private func findRock(from board: [[Character]]) throws -> (Int, Int) {
    let rockChar: Character = "R"

    for row in 0..<board.count {
      for col in 0..<board[0].count {
        guard board[row][col] != rockChar else {
          return (row, col)
        }
      }
    }

    throw FindRockError.noRockFoundError
  }

  private func countPawns(row: Int, col: Int, board: [[Character]]) -> Int {
    let pawnChar: Character = "p"
    let bishopChar: Character = "B"
    var directions = DirectionIterator()
    var curRow: Int = row
    var curCol: Int = col
    var count: Int = 0

    while let direction = directions.next() {
      while 0 <= curRow && curRow < board.count && 0 <= curCol && curCol < board[0].count {
        guard board[curRow][curCol] != pawnChar else {
          count += 1
          break
        }

        guard board[curRow][curCol] != bishopChar else {
          break
        }

        curRow += direction.row
        curCol += direction.col
      }

      curRow = row
      curCol = col
    }

    return count
  }
}
