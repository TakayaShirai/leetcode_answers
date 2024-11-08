import HeapModule

class Solution {
  func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    var heap: Heap<(Int)> = []
    var taskCounts = Array(repeating: 0, count: 26)
    var queue: [(taskCount: Int, availableFrom: Int)] = []
    var time: Int = 0

    for task in tasks {
      let curTask = alphaToNum(task)
      taskCounts[curTask] += 1
    }

    for taskCount in taskCounts {
      guard taskCount != 0 else { continue }
      heap.insert(taskCount)
    }

    while !heap.isEmpty || !queue.isEmpty {
      time += 1

      if !heap.isEmpty {
        let taskCount = heap.popMax()!

        if taskCount > 1 {
          queue.append((taskCount - 1, time + n))
        }
      }

      if !queue.isEmpty && queue[0].availableFrom == time {
        heap.insert(queue.removeFirst().taskCount)
      }
    }

    return time
  }

  func alphaToNum(_ alpha: Character) -> Int {
    guard let asciiValue = alpha.asciiValue else { return -1 }
    return Int(asciiValue - Character("A").asciiValue!)
  }
}
