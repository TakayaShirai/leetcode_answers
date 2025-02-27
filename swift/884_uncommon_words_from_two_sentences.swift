class Solution {
  func uncommonFromSentences(_ s1: String, _ s2: String) -> [String] {
    let s1ExtractedWords: [String] = s1.split(separator: " ").map { String($0) }
    let s2ExtractedWords: [String] = s2.split(separator: " ").map { String($0) }
    var wordCounter: [String : Int] = [:]
    var uniqueWords: [String] = []

    for word in s1ExtractedWords {
      wordCounter[word, default: 0] += 1
    }

    for word in s2ExtractedWords {
      wordCounter[word, default: 0] += 1
    }

    for (word, wordCnt) in wordCounter {
      if wordCnt == 1 {
        uniqueWords.append(word)
      }
    }

    return uniqueWords
  }
}