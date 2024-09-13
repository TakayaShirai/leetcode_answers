class Solution {
  func exist(_ board: [[Character]], _ word: String) -> Bool {
    let boardRows: Int = board.count
    let boardColumns: Int = board[0].count
    let arrayOfWord = Array(word)
    var seen: Set<[Int]> = []

    func backtrack(_ row: Int, _ column: Int, _ index: Int) -> Bool {
      if index == arrayOfWord.count {
        return true
      }

      guard 0 <= row, row < boardRows, 0 <= column, column < boardColumns else { return false }
      guard board[row][column] == arrayOfWord[index] else { return false }
      guard !seen.contains([row, column]) else { return false }

      seen.insert([row, column])

      let res =
        backtrack(row - 1, column, index + 1) || backtrack(row + 1, column, index + 1)
        || backtrack(row, column - 1, index + 1) || backtrack(row, column + 1, index + 1)

      seen.remove([row, column])

      return res
    }

    for row in 0..<boardRows {
      for column in 0..<boardColumns {
        if backtrack(row, column, 0) == true {
          return true
        }
      }
    }

    return false
  }
}
