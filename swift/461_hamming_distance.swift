class Solution {
  func hammingDistance(_ x: Int, _ y: Int) -> Int {
    // XOR
    let xorRes: Int = x ^ y
    return countBitOnes(xorRes)

    // Brute Force
    // var curX: Int = x
    // var curY: Int = y
    // var count: Int = 0

    // while curX > 0 || curY > 0 {
    //     let isSame: Bool = curX & 1 == curY & 1

    //     if !isSame {
    //         count += 1
    //     }

    //     curX = curX >> 1
    //     curY = curY >> 1
    // }

    // return count
  }

  private func countBitOnes(_ num: Int) -> Int {
    guard num > 0 else { return 0 }

    var curNum: Int = num
    var count: Int = 0

    while curNum > 0 {
      curNum &= curNum - 1
      count += 1
    }

    return count

    // guard num > 0 else { return 0 }

    // var curNum: Int = num
    // var count: Int = 0

    // while curNum > 0 {
    //     let curBitNum: Int = curNum % 2

    //     if curBitNum == 1 {
    //         count += 1
    //     }

    //     curNum = curNum >> 1
    // }

    // return count
  }
}
