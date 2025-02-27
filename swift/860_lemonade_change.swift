class Solution {
  func lemonadeChange(_ bills: [Int]) -> Bool {
    let lemonadeCost: Int = 5
    var remainingBillsCounter: [Int: Int] = [:]

    for bill in bills {
      let requiredChange: Int = bill - lemonadeCost
      remainingBillsCounter[bill, default: 0] += 1
      guard bill != lemonadeCost else { continue }
      guard
        canReturnChange(requiredChange: requiredChange, curRemainingBills: &remainingBillsCounter)
      else { return false }
    }

    return true
  }

  private func canReturnChange(requiredChange: Int, curRemainingBills: inout [Int: Int]) -> Bool {
    var curRemainingChange: Int = requiredChange
    let tenBill: Int = 10
    let fiveBill: Int = 5

    while curRemainingBills[tenBill] != nil && curRemainingBills[tenBill]! > 0 {
      guard curRemainingChange >= 10 else { break }
      curRemainingChange -= 10
      curRemainingBills[tenBill]! -= 1
      if curRemainingChange == 0 {
        return true
      }
    }

    while curRemainingBills[fiveBill] != nil && curRemainingBills[fiveBill]! > 0 {
      curRemainingChange -= 5
      curRemainingBills[fiveBill]! -= 1
      if curRemainingChange == 0 {
        return true
      }
    }

    return false
  }
}
