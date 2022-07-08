//

import SwiftUI

struct ParkView: View {
    private let park: Park
    private let fetcher: WaitTimesFetcher
    @State private var waitTimes: ParkQueueTimes? = nil
    @State private var searchText = ""

    var searchResults: [RideTimeView] {
        guard let waitTimes = waitTimes, !searchText.isEmpty else { return [] }

        let allRides = waitTimes.lands.flatMap({ $0.rides })
//        let allNames = allRides.map({ $0.name.lowercased() })
        let searchTermLowercased = searchText.lowercased()
        let results = allRides.filter({ $0.name.lowercased().contains(searchTermLowercased) })
        return results.map({ RideTimeView($0) })
    }

    init(_ park: Park) {
        self.park = park
        self.fetcher = WaitTimesFetcher(parkID: park.id)
    }

    var body: some View {
        Group {
            if let waitTimes = waitTimes {
                if !searchText.isEmpty {
                    List(searchResults.indices, id: \.self) { index in
                        searchResults[index]
                    }
                } else {
                    List(waitTimes.lands, id: \.id) { land in
                        NavigationLink(land.name, destination: LandView(land))
                    }
                }
            } else {
                List {
                    HStack {
                        Spacer()
                        ProgressView().onAppear(perform: {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                self.fetcher.fetchWaitTimes(completion: { result in
                                    switch result {
                                    case .success(let waitTimes): self.waitTimes = waitTimes
                                    case .failure(let error): print(error)
                                    }
                                })
                            }
                        })
                        Spacer()
                    }
                }
            }
        }
        .navigationTitle(park.name)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
}

struct ParkView_Previews: PreviewProvider {
    static var previews: some View {
        ParkView(Park.disneyWorldParks[0])
    }
}

extension View {
    // 1 Create a ViewBuilder function that can be applied to any type of content conforming to view
  @ViewBuilder func conditionalModifier<Content: View>(_ condition: Bool,
                                                       transform: (Self) -> Content) -> some View {
    if condition {
        // 2 If condition matches, apply the transform
      transform(self)
    } else {
      // 3 If not, just return the original view
      self
    }
  }
}
