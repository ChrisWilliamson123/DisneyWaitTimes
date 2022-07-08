import Foundation

struct ParkQueueTimes: Decodable {
    let lands: [Land]
}

struct Land: Decodable {
    let id: Int
    let name: String
    let rides: [Ride]
}

struct Ride: Decodable {
    let id: Int
    let name: String
    let is_open: Bool
    let wait_time: Int
    let last_updated: Date
}
