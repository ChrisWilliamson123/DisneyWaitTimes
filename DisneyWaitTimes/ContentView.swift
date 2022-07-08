//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ParksListView()
                .navigationTitle("Walt Disney World")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
