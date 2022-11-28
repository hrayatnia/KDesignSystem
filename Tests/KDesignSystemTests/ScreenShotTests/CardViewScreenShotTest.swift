import XCTest
import SnapshotTesting
import SwiftUI
@testable import KDesignSystem

final class CardViewScreenShotTest: SnapshotBaseTestCase {
    
    var viewController: UIViewController!
    
    private func view(axes: Axis.Set = .vertical,
                      @ViewBuilder content: @escaping () -> AnyView) -> UIViewController {
        UIHostingController(rootView: CardView { content() }.frame(width: 320, height: 130))
    }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        viewController = view { AnyView(EmptyView()) }
    }
    
    func testBasicCardView() {
        viewController = view {
            AnyView(
                VStack {
                    HStack {
                        Text("City")
                        Spacer()
                        Text("11 c")
                    }.padding()
                    
                    HStack {
                        Text("Cloudy")
                        Spacer()
                        Text("H: 12/L: 0")
                    }
                    .padding()
                }
                    .background(Color.gray)
                    .modifier(CardModifier(shadow: .clear))
            )
        }
        assertSnapshot(matching: viewController.view, as: .image)
    }
    
}
