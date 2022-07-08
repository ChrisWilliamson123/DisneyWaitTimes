//

import SwiftUI

struct RideTimeView: View {
    private let ride: Ride

    init(_ ride: Ride) {
        self.ride = ride
    }

    var body: some View {
        HStack {
            Text(ride.name)
            Spacer()
            if ride.is_open {
                Text("\(ride.wait_time)")
            } else {
                Text("Closed").foregroundColor(.red)
            }
        }
    }
}

struct RideTimeView_Previews: PreviewProvider {
    static var previews: some View {
        RideTimeView(Ride(id: 2, name: "Space Mountain", is_open: true, wait_time: 10, last_updated: Date()))
    }
}
