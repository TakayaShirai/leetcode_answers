class Solution {
  func convert(_ s: String, _ numRows: Int) -> String {
    guard numRows > 1 else { return s }

    let arrayS = Array(s)
    let arrayLen = arrayS.count
    var convertedCharsArray: [Character] = []

    for row in 0..<numRows {
      let increment = 2 * (numRows - 1)

      for i in stride(from: row, to: arrayLen, by: increment) {
        convertedCharsArray.append(arrayS[i])

        if row > 0 && row < (numRows - 1) {
          let nextCharIdx = i + increment - 2 * row
          guard nextCharIdx < arrayLen else { continue }

          convertedCharsArray.append(arrayS[nextCharIdx])
        }
      }
    }

    return String(convertedCharsArray)
  }
}
