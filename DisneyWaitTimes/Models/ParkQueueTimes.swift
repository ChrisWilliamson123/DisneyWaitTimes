struct ParkQueueTimes {
    let lands: [Land]
}

struct Land {
    let id: Int
    let name: String
    let rides: [Ride]
}

struct Ride {
    let id: Int
    let name: String
    let is_open: Bool
    let wait_time: Int
    let last_updated: Date
}
