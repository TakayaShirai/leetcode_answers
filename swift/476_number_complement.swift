class Solution {
  func findComplement(_ num: Int) -> Int {
    var mask = ~0
    var tempNum = num

    while tempNum & mask != 0 {
      mask <<= 1
    }

    return ~mask & ~num

    // var complement: Int = 0
    // var curNum: Int = num
    // var powTwo: Int = 1

    // while curNum > 0 {
    //     let curComplement: Int = curNum % 2 == 1 ? 0 : 1
    //     complement += curComplement * powTwo
    //     powTwo *= 2
    //     curNum /= 2
    // }

    // return complement
  }
}
