//

import SwiftUI

struct ParksListView: View {
    private let parks: [Park]

    init(parks: [Park] = Park.disneyWorldParks) {
        self.parks = parks
    }

    var body: some View {
        List(parks, id: \.id) { park in
            NavigationLink(destination: ParkView(park)) {
                Text(park.name)
            }
        }
    }
}

struct ParksListView_Previews: PreviewProvider {
    static var previews: some View {
        ParksListView()
    }
}
