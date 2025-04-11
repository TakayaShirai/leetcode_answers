class RandomizedSet {

  private var values: [Int]
  private var valueToIdx: [Int: Int]

  init() {
    valueToIdx = [:]
    values = []
  }

  func insert(_ val: Int) -> Bool {
    guard valueToIdx[val] == nil else {
      return false
    }

    values.append(val)
    valueToIdx[val] = values.count - 1
    return true
  }

  func remove(_ val: Int) -> Bool {
    guard let idxToRemove = valueToIdx[val] else {
      return false
    }

    let lastElement: Int = values.last!
    let lastIdx: Int = values.count - 1

    values[idxToRemove] = lastElement
    valueToIdx[lastElement] = idxToRemove

    values.removeLast()
    valueToIdx.removeValue(forKey: val)

    return true
  }

  func getRandom() -> Int {
    let randIdx = Int.random(in: 0..<values.count)
    return values[randIdx]
  }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */
