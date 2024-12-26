class Solution {
  func isIsomorphic(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }

    var sCharLastSeenIdxMap: [Character: Int] = [:]
    var tCharLastSeenIdxMap: [Character: Int] = [:]

    let sArray = Array(s)
    let tArray = Array(t)

    for i in 0..<s.count {
      if sCharLastSeenIdxMap[sArray[i]] != tCharLastSeenIdxMap[tArray[i]] {

        return false
      }

      sCharLastSeenIdxMap[sArray[i]] = i
      tCharLastSeenIdxMap[tArray[i]] = i
    }

    return true

    // var mapStoT: [Character: Character] = [:]
    // var mappedChars: Set<Character> = []

    // let sArray = Array(s)
    // let tArray = Array(t)

    // for i in 0..<sArray.count {
    //   let sChar = sArray[i]
    //   let tChar = tArray[i]

    //   if let mappedChar = mapStoT[sChar] {
    //     if mappedChar != tChar {
    //       return false
    //     }
    //   } else {
    //     if mappedChars.contains(tChar) {
    //       return false
    //     }
    //     mapStoT[sChar] = tChar
    //     mappedChars.insert(tChar)
    //   }
    // }

    // return true
  }
}
