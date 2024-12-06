class Solution {
  func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
    var priceTable: [Int] = createInitialPriceTable(n, src)

    for i in 0..<(k + 1) {
      var tempPriceTable = priceTable

      for flight in flights {
        let src = flight[0]
        let dst = flight[1]
        let price = flight[2]

        if priceTable[src] == Int.max {
          continue
        }

        tempPriceTable[dst] = min(tempPriceTable[dst], price + priceTable[src])
      }

      priceTable = tempPriceTable
    }

    return priceTable[dst] == Int.max ? -1 : priceTable[dst]
  }

  private func createInitialPriceTable(_ n: Int, _ src: Int) -> [Int] {
    var table: [Int] = Array(repeating: Int.max, count: n)
    table[src] = 0
    return table
  }
}
