class Solution {
    func finalPrices(_ prices: [Int]) -> [Int] {
        var monIncStack: [(Int, Int)] = []
        var res: [Int] = prices
        
        for (i, price) in prices.enumerated() {
            while !monIncStack.isEmpty && price <= monIncStack.last!.0 {
                let cur = monIncStack.popLast()!
                res[cur.1] = cur.0 - price
            }
            
            monIncStack.append((price, i))
        }
        
        return res
    }
}

