/**
 * Forward declaration of guess API.
 * @param  num -> your guess number
 * @return 	     -1 if num is higher than the picked number
 *			      1 if num is lower than the picked number
 *               otherwise return 0
 * func guess(_ num: Int) -> Int
 */

class Solution: GuessGame {
  func guessNumber(_ n: Int) -> Int {
    var left: Int = 0
    var right: Int = n

    while left <= right {
      let mid: Int = left + (right - left) / 2
      let guessRes: Int = guess(mid)

      if guessRes == 0 {
        return mid
      } else if guessRes == 1 {
        left = mid + 1
      } else {
        right = mid - 1
      }
    }

    return left
  }
}
