import HeapModule

struct TweetInfo: Comparable {
  let time: Int
  let tweetId: Int
  let userId: Int
  let index: Int

  static func < (lhs: TweetInfo, rhs: TweetInfo) -> Bool {
    return lhs.time < rhs.time
  }
}

class Twitter {

  var time: Int
  var tweets: [Int: [(time: Int, tweetId: Int)]]
  var follow: [Int: Set<Int>]

  init() {
    self.time = 0
    self.tweets = [Int: [(time: Int, tweetId: Int)]]()
    self.follow = [Int: Set<Int>]()
  }

  func postTweet(_ userId: Int, _ tweetId: Int) {
    if tweets[userId] == nil {
      tweets[userId] = []
    }
    tweets[userId]!.append((time, tweetId))
    time += 1
  }

  func getNewsFeed(_ userId: Int) -> [Int] {
    var res: [Int] = []
    var heap = Heap<TweetInfo>()

    follow[userId, default: Set()].insert(userId)

    for followeeId in follow[userId]! {
      if let userTweets = tweets[followeeId], let lastTweet = userTweets.last {
        let (tweetTime, tweetId) = lastTweet
        heap.insert(
          TweetInfo(
            time: tweetTime, tweetId: tweetId, userId: followeeId, index: userTweets.count - 1))
      }
    }

    while !heap.isEmpty && res.count < 10 {
      let topTweet = heap.popMax()!
      res.append(topTweet.tweetId)

      if topTweet.index > 0 {
        let prevTweet = tweets[topTweet.userId]![topTweet.index - 1]
        heap.insert(
          TweetInfo(
            time: prevTweet.time, tweetId: prevTweet.tweetId, userId: topTweet.userId,
            index: topTweet.index - 1))
      }
    }

    return res
  }

  func follow(_ followerId: Int, _ followeeId: Int) {
    follow[followerId, default: Set()].insert(followeeId)
  }

  func unfollow(_ followerId: Int, _ followeeId: Int) {
    follow[followerId]?.remove(followeeId)
  }
}

/**
 * Usage:
 * let obj = Twitter()
 * obj.postTweet(userId, tweetId)
 * let feed = obj.getNewsFeed(userId)
 * obj.follow(followerId, followeeId)
 * obj.unfollow(followerId, followeeId)
 */
