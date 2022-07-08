//

import SwiftUI

struct ParksListView: View {
    private let parks: [Park]

    init(parks: [Park] = Park.disneyWorldParks) {
        self.parks = parks
    }

    var body: some View {
        List(parks, id: \.id) { park in
            ListRowWithImageView(name: park.name, imageID: park.id, destination: ParkView(park))
        }
    }
}

struct ParksListView_Previews: PreviewProvider {
    static var previews: some View {
        ParksListView()
    }
}
