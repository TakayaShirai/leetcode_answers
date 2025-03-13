import HeapModule

class Solution {
  func fillCups(_ amount: [Int]) -> Int {
    var amountMaxHeap = Heap<Int>()
    var curTime: Int = 0

    for curAmount in amount {
      if curAmount > 0 {
        amountMaxHeap.insert(curAmount)
      }
    }

    while !amountMaxHeap.isEmpty {
      if amountMaxHeap.count >= 2 {
        var maxAmount = amountMaxHeap.popMax()!
        var secMaxAmount = amountMaxHeap.popMax()!
        maxAmount -= 1
        secMaxAmount -= 1

        if maxAmount > 0 {
          amountMaxHeap.insert(maxAmount)
        }
        if secMaxAmount > 0 {
          amountMaxHeap.insert(secMaxAmount)
        }

        curTime += 1
      } else {
        let remainingAmount = amountMaxHeap.popMax()!
        curTime += remainingAmount
      }
    }

    return curTime
  }
}
