class Solution {
  func findRepeatedDnaSequences(_ s: String) -> [String] {
    let dnaSequenceLen: Int = 10
    guard s.count >= dnaSequenceLen else { return [] }

    var repeatedSeqSet: Set<String> = []
    var dupRepeatedSeqSet: Set<String> = []

    for curIdx in 0..<(s.count - dnaSequenceLen + 1) {
      let dnaStartIdx: String.Index = s.index(s.startIndex, offsetBy: curIdx)
      let dnaEndIdx: String.Index = s.index(s.startIndex, offsetBy: curIdx + dnaSequenceLen - 1)
      let curSeq = String(s[dnaStartIdx...dnaEndIdx])
      guard !repeatedSeqSet.contains(curSeq) else {
        dupRepeatedSeqSet.insert(curSeq)
        continue
      }
      repeatedSeqSet.insert(curSeq)
    }

    return Array(dupRepeatedSeqSet)
  }
}
