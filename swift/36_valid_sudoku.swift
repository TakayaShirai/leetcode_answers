class Solution {
  func isValidSudoku(_ board: [[Character]]) -> Bool {
    var rowCharsSet: [Set<Character>] = Array(repeating: Set<Character>(), count: 9)
    var colCharsSet: [Set<Character>] = Array(repeating: Set<Character>(), count: 9)
    var subBoxCharsSet: [Set<Character>] = Array(repeating: Set<Character>(), count: 9)
    let nonNumGridChar: Character = "."

    for row in 0..<board.count {
      for col in 0..<board[0].count {
        let curChar: Character = board[row][col]
        guard curChar != nonNumGridChar else { continue }

        let subBoxIdx: Int = row / 3 + (col / 3) * 3

        guard
          !rowCharsSet[row].contains(curChar) && !colCharsSet[col].contains(curChar)
            && !subBoxCharsSet[subBoxIdx].contains(curChar)
        else {
          return false
        }

        rowCharsSet[row].insert(curChar)
        colCharsSet[col].insert(curChar)
        subBoxCharsSet[subBoxIdx].insert(curChar)
      }
    }

    return true
  }
}
