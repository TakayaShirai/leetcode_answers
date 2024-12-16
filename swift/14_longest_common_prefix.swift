class Solution {
  func longestCommonPrefix(_ strs: [String]) -> String {
    let firstStr = strs[0]
    var commonPrefix: String = ""

    for (index, char) in firstStr.enumerated() {
      for str in strs {
        guard index < str.count else { return commonPrefix }

        let charIdx: String.Index = str.index(str.startIndex, offsetBy: index)

        if char != str[charIdx] {
          return commonPrefix
        }
      }

      commonPrefix.append(char)
    }

    return commonPrefix
  }
}

// class Solution {
//   func longestCommonPrefix(_ strs: [String]) -> String {
//     var commonPrefix: String = ""
//     let firstStrArray = Array(strs[0])

//     for curIdx in 0..<firstStrArray.count {
//       let curChar = firstStrArray[curIdx]
//       var correctCnt: Int = 1

//       for curStrIdx in 1..<strs.count {
//         let currentStrArray = Array(strs[curStrIdx])

//         if !isCommonPrefix(curIdx, curChar, currentStrArray) {
//           return commonPrefix
//         }
//       }

//       commonPrefix += String(curChar)
//     }

//     return commonPrefix
//   }

//   private func isCommonPrefix(_ curIdx: Int, _ curChar: Character, _ strArray: [Character]) -> Bool
//   {
//     if curIdx >= strArray.count || curChar != strArray[curIdx] {
//       return false
//     }

//     return true
//   }
// }
