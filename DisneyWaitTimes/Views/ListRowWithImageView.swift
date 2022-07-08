//

import SwiftUI

struct ListRowWithImageView<Content: View>: View {
    let name: String
    let imageID: Int
    let destination: Content

    var body: some View {
        ZStack {
            NavigationLink(destination: destination) { EmptyView() }.opacity(0)
            VStack {
                Spacer()
                HStack(alignment: .center) {
                    Text(name).font(.title2)
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
                Image("\(imageID)").resizable().aspectRatio(contentMode: .fill)
                LinearGradient(gradient: Gradient(colors: [.clear, Color(uiColor: .black.withAlphaComponent(0.5))]), startPoint: .top, endPoint: .bottom)
            }
        )
    }
}

struct ListRowWithImageView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowWithImageView(name: "Africa", imageID: 216, destination: EmptyView())
    }
}
