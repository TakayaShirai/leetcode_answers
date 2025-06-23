// This file contains an implementation of a Trie (Prefix Tree) data structure.
// It includes the main `Trie` class for handling operations and the internal
// `TrieNode` class that represents each node in the tree.

import Foundation

/// A Trie is a tree-like data structure used to
/// efficiently store and retrieve keys in a dataset of strings.
class Trie {
  private let rootNode: TrieNode

  init() {
    rootNode = TrieNode()
  }

  /// Inserts a word into the Trie.
  ///
  /// - Parameter word: The word to insert into the Trie.
  func insert(_ word: String) {
    var curNode: TrieNode = rootNode

    for char in word {
      if let childNode = curNode.children[char] {
        curNode = childNode
      } else {
        let newNode = TrieNode()
        curNode.children[char] = newNode
        curNode = newNode
      }
    }

    curNode.isEndOfWord = true
  }

  /// Searches for a word in the Trie to see if it exists as a complete word.
  ///
  /// - Parameter word: The word to search for.
  /// - Returns: `true` if the word exists as a complete entry in the Trie, and `false` otherwise.
  func search(_ word: String) -> Bool {
    var curNode: TrieNode = rootNode

    for char in word {
      guard let childNode = curNode.children[char] else { return false }
      curNode = childNode
    }

    return curNode.isEndOfWord
  }

  /// Determines if there is any word in the Trie that starts with the given prefix.
  ///
  /// - Parameter prefix: The prefix to check for.
  /// - Returns: `true` if there is any word in the Trie with the given prefix, and `false` otherwise.
  func startsWith(_ prefix: String) -> Bool {
    var curNode: TrieNode = rootNode

    for char in prefix {
      guard let childNode = curNode.children[char] else { return false }
      curNode = childNode
    }

    return true
  }
}

/// Represents a single node in the Trie.
private class TrieNode {

  /// A dictionary mapping a character to its corresponding child node.
  var children: [Character: TrieNode]

  /// A boolean flag indicating whether this node represents the end of a complete word.
  var isEndOfWord: Bool

  init(_ children: [Character: TrieNode] = [:], _ isEndOfWord: Bool = false) {
    self.children = children
    self.isEndOfWord = isEndOfWord
  }
}
