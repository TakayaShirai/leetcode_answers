class Solution {
  func reverse(_ x: Int) -> Int {
    let maxInt32 = Int32.max
    let minInt32 = Int32.min

    let firstDigMax = maxInt32 % 10
    let firstDigMin = minInt32 % 10

    let maxWithoutFirDig = maxInt32 / 10
    let minWithoutFirDig = minInt32 / 10

    var x = x
    var res = 0

    while x != 0 {
      let firstDig = x % 10
      x /= 10

      if res > maxWithoutFirDig || (res == maxWithoutFirDig && firstDig >= firstDigMax) {
        return 0
      }

      if res < minWithoutFirDig || (res == minWithoutFirDig && firstDig <= firstDigMin) {
        return 0
      }

      res *= 10
      res += firstDig
    }

    return res
  }
}
