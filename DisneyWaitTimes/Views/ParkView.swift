//

import SwiftUI

struct ParkView: View {
    private let park: Park
    private let fetcher: WaitTimesFetcher
    @State private var waitTimes: ParkQueueTimes? = nil

    init(_ park: Park) {
        self.park = park
        self.fetcher = WaitTimesFetcher(parkID: park.id)
    }

    var body: some View {
        Group {
            if let waitTimes = waitTimes {
                List(waitTimes.lands, id: \.id) { land in
                    NavigationLink(land.name, destination: LandView(land))
                }
            } else {
                ProgressView().onAppear(perform: {
                    fetcher.fetchWaitTimes(completion: { result in
                        switch result {
                        case .success(let waitTimes): self.waitTimes = waitTimes
                        case .failure(let error): print(error)
                        }
                    })
                })
            }
        }.navigationTitle(park.name)
    }
}

struct ParkView_Previews: PreviewProvider {
    static var previews: some View {
        ParkView(Park.disneyWorldParks[0])
    }
}
