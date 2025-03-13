import HeapModule

struct CharFrequency: Comparable {
  let char: Character
  let count: Int

  static func == (lhs: CharFrequency, rhs: CharFrequency) -> Bool {
    return lhs.count == rhs.count
  }

  static func < (lhs: CharFrequency, rhs: CharFrequency) -> Bool {
    return lhs.count < rhs.count
  }
}

class Solution {
  func reorganizeString(_ s: String) -> String {
    let charCounter: [Character: Int] = createCharCounter(of: s)
    var maxHeap = Heap<CharFrequency>()

    for (char, count) in charCounter {
      let charFreq: CharFrequency = CharFrequency(char: char, count: count)
      maxHeap.insert(charFreq)
    }

    var reorganizedString: String = ""
    var prevCharFrequency: CharFrequency? = nil

    while !maxHeap.isEmpty {
      let curCharFreq: CharFrequency = maxHeap.popMax()!
      let curChar: Character = curCharFreq.char
      let curCnt: Int = curCharFreq.count

      reorganizedString.append(curChar)

      if let prev = prevCharFrequency, prev.count > 0 {
        maxHeap.insert(prev)
      }

      prevCharFrequency = CharFrequency(char: curChar, count: curCnt - 1)
    }

    return reorganizedString.count == s.count ? reorganizedString : ""
  }

  private func createCharCounter(of str: String) -> [Character: Int] {
    var charCounter: [Character: Int] = [:]

    for char in str {
      charCounter[char, default: 0] += 1
    }

    return charCounter
  }
}
