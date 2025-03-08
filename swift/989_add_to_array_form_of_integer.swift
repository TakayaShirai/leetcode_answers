class Solution {
  func addToArrayForm(_ num: [Int], _ k: Int) -> [Int] {
    var sumArr: [Int] = []
    var carry: Int = k
    var curIdx: Int = num.count - 1

    while curIdx >= 0 || carry > 0 {
      if curIdx >= 0 {
        carry += num[curIdx]
        curIdx -= 1
      }
      sumArr.append(carry % 10)
      carry /= 10
    }

    return sumArr.reversed()
  }
}
