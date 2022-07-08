//

import SwiftUI

struct ParksListView: View {
    private let parks: [Park]

    init(parks: [Park] = Park.disneyWorldParks) {
        self.parks = parks
    }

    var body: some View {
        List(parks, id: \.id) { park in
            ZStack {
                NavigationLink(destination: ParkView(park)) { EmptyView() }.opacity(0)
                VStack {
                    Spacer()
                    HStack(alignment: .center) {
                        Text(park.name).font(.title2)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 7)
                    }
                }
                .foregroundColor(.white)
            }
            .frame(height: 125)
            .listRowBackground(
                ZStack {
                    Image("\(park.id)").resizable().aspectRatio(contentMode: .fill)
                    LinearGradient(gradient: Gradient(colors: [.clear, Color(uiColor: .black.withAlphaComponent(0.5))]), startPoint: .top, endPoint: .bottom)
                }
            )
        }
    }
}

struct ParksListView_Previews: PreviewProvider {
    static var previews: some View {
        ParksListView()
    }
}
