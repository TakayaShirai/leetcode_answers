public class TrieNode {

  var children: [Character: TrieNode]
  var endOfWord: Bool

  init() {
    self.children = [:]
    self.endOfWord = false
  }
}

class Trie {

  var root: TrieNode

  init() {
    self.root = TrieNode()
  }

  func insert(_ word: String) {
    let wordArray = Array(word)
    var cur = self.root

    for char in wordArray {
      if let child = cur.children[char] {
        cur = child
      } else {
        cur.children[char] = TrieNode()
        cur = cur.children[char]!
      }
    }

    cur.endOfWord = true
  }

  func search(_ word: String) -> Bool {
    let wordArray = Array(word)
    var cur = self.root

    for char in wordArray {
      if cur.children[char] == nil {
        return false
      }

      cur = cur.children[char]!
    }

    return cur.endOfWord
  }

  func startsWith(_ prefix: String) -> Bool {
    let prefixArray = Array(prefix)
    var cur = self.root

    for char in prefixArray {
      if cur.children[char] == nil {
        return false
      }

      cur = cur.children[char]!
    }

    return true
  }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
