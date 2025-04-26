class Solution {
  func kthGrammar(_ n: Int, _ k: Int) -> Int {
    guard k > 2 else { return k - 1 }

    if k % 2 == 0 {
      return kthGrammar(n, k / 2) == 0 ? 1 : 0
    } else {
      return kthGrammar(n, k / 2 + 1) == 0 ? 0 : 1
    }
  }
}
