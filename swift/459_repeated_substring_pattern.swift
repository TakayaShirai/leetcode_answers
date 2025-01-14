class Solution {
  func repeatedSubstringPattern(_ s: String) -> Bool {
    // Adding two s
    // 1. Create a string that consists of two s.
    // 2. Remove the first and last letter of it.
    // 3. Return if the string contains s.
    guard s.count > 1 else { return false }

    let combinedStr: String = s + s
    let firstAndLastRemovedStr: String = String(Array(combinedStr)[1...(combinedStr.count - 2)])

    return firstAndLastRemovedStr.contains(s)

    // Brute Force
    // 1. Create a substring.
    // 2. Check if the substring can construct the original string by repeating it.
    // 3. Repeat this process while the length of the substring get over the half of that of the original one.

    // for lastIdx in 0..<(s.count / 2) {
    //     let substringLen: Int = lastIdx + 1

    //     if s.count % substringLen == 0 {
    //         let substring: String = String(Array(s)[0...lastIdx])
    //         let neededSubstringCnt: Int = s.count / substringLen
    //         var combinedString: String = ""

    //         for _ in 0..<neededSubstringCnt {
    //             combinedString += substring
    //         }

    //         if combinedString == s {
    //             return true
    //         }

    //     } else {
    //         continue
    //     }
    // }

    // return false
  }
}
