import HeapModule

struct Task: Comparable {
  var type: Character
  var count: Int
  var availableTime: Int

  static func == (lhs: Task, rhs: Task) -> Bool {
    return lhs.count == rhs.count
  }

  static func < (lhs: Task, rhs: Task) -> Bool {
    return lhs.count < rhs.count
  }
}

class Solution {
  func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    var curTime: Int = 0
    var taskCounter: [Character: Int] = createTaskCounter(of: tasks)
    var taskMaxHeap = Heap<Task>()
    var queuedTasks: [Task] = []

    for (taskType, count) in taskCounter {
      let task = Task(type: taskType, count: count, availableTime: 0)
      taskMaxHeap.insert(task)
    }

    while !taskMaxHeap.isEmpty || !queuedTasks.isEmpty {
      if !taskMaxHeap.isEmpty {
        var curTask: Task = taskMaxHeap.popMax()!
        curTask.count -= 1
        curTask.availableTime = curTime + n

        if curTask.count > 0 {
          queuedTasks.append(curTask)
        }
      }

      if !queuedTasks.isEmpty && queuedTasks[0].availableTime <= curTime {
        let availableTask: Task = queuedTasks.removeFirst()
        taskMaxHeap.insert(availableTask)
      }

      curTime += 1
    }

    return curTime
  }

  private func createTaskCounter(of tasks: [Character]) -> [Character: Int] {
    var taskCounter: [Character: Int] = [:]

    for task in tasks {
      taskCounter[task, default: 0] += 1
    }

    return taskCounter
  }
}
