struct Park {
    let name: String
    let id: Int

    static let disneyWorldParks: [Park] = [
        .init(name: "Animal Kingdom", id: 8),
        .init(name: "Epcot", id: 5),
        .init(name: "Hollywood Studios", id: 7),
        .init(name: "Magic Kingdom", id: 6)
    ]
}
