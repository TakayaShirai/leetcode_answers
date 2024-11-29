class Solution {
  private let substrLen: Int = 3

  func countGoodSubstrings(_ s: String) -> Int {
    guard s.count >= 3 else { return 0 }

    let arrayS = Array(s)
    var validSubstrCnt: Int = 0

    for i in 0..<(arrayS.count - 3 + 1) {
      if arrayS[i] != arrayS[i + 1] && arrayS[i + 1] != arrayS[i + 2] && arrayS[i + 2] != arrayS[i]
      {
        validSubstrCnt += 1
      }
    }

    return validSubstrCnt

    // guard s.count >= 3 else { return 0 }

    // let arrayS = Array(s)
    // var substrHashTable: [Character : Int] = initHashTable(arrayS)
    // var validSubstrCnt: Int = isValidSubstr(substrHashTable) ? 1 : 0

    // for left in 1..<(arrayS.count - substrLen + 1) {
    //   let right = left + 2
    //   substrHashTable = updateHashTable(left, right, substrHashTable, arrayS)

    //   if isValidSubstr(substrHashTable) {
    //     validSubstrCnt += 1
    //   }
    // }

    // return validSubstrCnt
  }

  // private func initHashTable(_ arrayS: [Character]) -> [Character : Int] {
  //   var hashTable: [Character : Int] = [:]

  //   for i in 0..<substrLen {
  //     hashTable[arrayS[i], default: 0] += 1
  //   }

  //   return hashTable
  // }

  // private func isValidSubstr(_ substrHashTable: [Character : Int]) -> Bool {
  //   return substrHashTable.count == substrLen
  // }

  // private func updateHashTable(_ left: Int, _ right: Int, _ substrHashTable: [Character : Int], _ arrayS: [Character]) -> [Character : Int] {
  //   guard left > 0 && right < arrayS.count else { return substrHashTable }

  //   var newHashTable = substrHashTable
  //   let prevLeftChar = arrayS[left-1]
  //   let curRightChar = arrayS[right]

  //   if let prevLeftCharNum = newHashTable[prevLeftChar] {
  //     if prevLeftCharNum == 1 {
  //       newHashTable.removeValue(forKey: prevLeftChar)
  //     } else {
  //       newHashTable[prevLeftChar]! -= 1
  //     }
  //   }

  //   newHashTable[curRightChar, default: 0] += 1

  //   return newHashTable
  // }
}
