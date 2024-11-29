public class TrieNode {
  var children: [Character: TrieNode]
  var endOfWord: Bool

  init() {
    self.children = [:]
    self.endOfWord = false
  }
}

class WordDictionary {
  private var root: TrieNode

  init() {
    self.root = TrieNode()
  }

  func addWord(_ word: String) {
    var cur = root
    for char in word {
      if cur.children[char] == nil {
        cur.children[char] = TrieNode()
      }
      cur = cur.children[char]!
    }
    cur.endOfWord = true
  }

  func search(_ word: String) -> Bool {
    return dfs(0, root, Array(word))
  }

  private func dfs(_ index: Int, _ node: TrieNode, _ word: [Character]) -> Bool {
    if index == word.count {
      return node.endOfWord
    }

    let char = word[index]

    if char == "." {
      for child in node.children.values {
        if dfs(index + 1, child, word) {
          return true
        }
      }
      return false
    } else {
      guard let child = node.children[char] else {
        return false
      }
      return dfs(index + 1, child, word)
    }
  }
}

/**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */
