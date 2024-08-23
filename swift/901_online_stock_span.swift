class StockSpanner {
  var monDecStack: [(Int, Int)]

  init() {
    self.monDecStack = []
  }

  func next(_ price: Int) -> Int {
    var res = 1

    while !monDecStack.isEmpty && price >= monDecStack.last!.0 {
      let cur = monDecStack.popLast()!
      res += cur.1
    }

    monDecStack.append((price, res))

    return res
  }
}

/**
 * Your StockSpanner object will be instantiated and called as such:
 * let obj = StockSpanner()
 * let ret_1: Int = obj.next(price)
 */
