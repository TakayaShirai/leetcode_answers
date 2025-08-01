class Solution {

  /// Represents the four directions for the robot's orientation.
  private enum Direction {
    case north
    case east
    case south
    case west

    func turnLeft() -> Direction {
      switch self {
      case .north: return .west
      case .east: return .north
      case .south: return .east
      case .west: return .south
      }
    }

    func turnRight() -> Direction {
      switch self {
      case .north: return .east
      case .east: return .south
      case .south: return .west
      case .west: return .north
      }
    }
  }

  /// Checks if there exists a circle in the plane such that the robot
  /// never leaves it after following a given set of instructions.
  ///
  /// - Parameter instructions: A string containing the robot's movement instructions.
  /// - Returns: `true` if the robot travels in a cycle, `false` if it moves away.
  func isRobotBounded(_ instructions: String) -> Bool {
    let initialX: Int = 0
    let initialY: Int = 0

    var curX: Int = initialX
    var curY: Int = initialY
    var curDirection: Direction = .north

    for instruction in instructions {
      switch instruction {
      case "L":
        curDirection = curDirection.turnLeft()
      case "R":
        curDirection = curDirection.turnRight()
      case "G":
        switch curDirection {
        case .north: curY += 1
        case .east: curX += 1
        case .south: curY -= 1
        case .west: curX -= 1
        }
      default:
        continue
      }
    }

    let isAtOrigin: Bool = (curX == initialX && curY == initialY)
    let isFacingNorth: Bool = (curDirection == .north)

    return isAtOrigin || !isFacingNorth
  }
}
