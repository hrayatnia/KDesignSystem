import SwiftUI

public struct CardView<Content>: View where Content: View {
    private let content: () -> Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    public var body: some View {
        VStack {
            content()
        }
    }
}

#if DEBUG
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        LazyListView {
            ForEach(1..<10) { _ in
                CardView {
                    HStack {
                        Text("City")
                        Spacer()
                        Text("11 c")
                    }
                    .padding()
                    
                    HStack {
                        Text("Cloudy")
                        Spacer()
                        Text("H: 12/L: 0")
                    }
                    .padding()
                }
                .background(Color.gray)
                .modifier(CardModifier(shadow: .clear))
            }
        }.padding()
    }
}
#endif
