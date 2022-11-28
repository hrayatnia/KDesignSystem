import SwiftUI

public struct LazyListView<Content>: View where Content: View {
    
    private let content: () -> Content
    private let axes: Axis.Set
    private let showsIndicators: Bool
    
    public init(axes: Axis.Set = .vertical,
                showsIndicators: Bool = false,
                @ViewBuilder content: @escaping () -> Content) {
        self.axes = axes
        self.showsIndicators = showsIndicators
        self.content = content
    }

    public var body: some View {
        ScrollView(axes, showsIndicators: showsIndicators) {
           view
        }
    }
    
    private var view: some View {
        axes == .vertical ? AnyView(LazyVStack { content() }) : AnyView(LazyHStack { content() })
    }
}


#if DEBUG

struct LazyListView_Provider: PreviewProvider {
    static var previews: some View {
        LazyListView {
            ForEach(1..<10) { _ in
                VStack {
                    Image(systemName: "square.and.arrow.up")
                    Text("lorem ipsum")
                }
            }
        }
    }
}

#endif
