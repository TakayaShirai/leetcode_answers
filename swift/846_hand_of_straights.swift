import HeapModule

class Solution {
  func isNStraightHand(_ hand: [Int], _ groupSize: Int) -> Bool {
    guard hand.count % groupSize == 0 else { return false }

    var countMap: [Int: Int] = [:]
    var heap = Heap<Int>()

    for card in hand {
      countMap[card, default: 0] += 1
      if countMap[card] == 1 {
        heap.insert(card)
      }
    }

    while let current = heap.popMin() {
      guard let currentCount = countMap[current], currentCount > 0 else {
        continue
      }

      for i in 0..<groupSize {
        let nextCard = current + i
        guard let nextCount = countMap[nextCard], nextCount >= currentCount else { return false }

        countMap[nextCard]! -= currentCount
        if countMap[nextCard] == 0 {
          countMap.removeValue(forKey: nextCard)
        }
      }
    }

    return true
  }
}
