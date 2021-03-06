//

import SwiftUI

struct LandView: View {
    private let land: Land

    init(_ land: Land) {
        self.land = land
    }

    var body: some View {
        List(land.rides, id: \.id) { ride in
            RideTimeView(ride)
        }
        .navigationTitle(land.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandView_Previews: PreviewProvider {
    static var previews: some View {
        LandView(Land(id: 1,
                      name: "Tomorrowland",
                      rides: [Ride(id: 2, name: "Space Mountain", is_open: true, wait_time: 10, last_updated: Date())]))
    }
}
