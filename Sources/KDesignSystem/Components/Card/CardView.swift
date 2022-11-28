import SwiftUI

struct CardView<Content>: View where Content: View {
    private let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
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
                }
                .padding()
                .background(Color.gray)
                .modifier(CardModifier(shadow: .clear))
            }
        }.padding()
    }
}
#endif
