import XCTest
import SnapshotTesting
import SwiftUI
@testable import KDesignSystem

final class LazyViewScreenShotTest: SnapshotBaseTestCase {
    
    var viewController: UIViewController!
    
    private func view(axes: Axis.Set = .vertical,
                      @ViewBuilder content: @escaping () -> AnyView) -> UIViewController {
        UIHostingController(rootView: LazyListView(axes: axes) { content() }.frame(width: 320, height: 700))
    }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        viewController = view { AnyView(EmptyView()) }
    }
    
    func testVerticalView() {
        viewController = view {
            AnyView (
                ForEach(1..<11) { _ in
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ")
                        .padding()
                }
            )
        }
        assertSnapshot(matching: viewController.view, as: .image)
    }
    
    func testHorizontalView() {
        viewController = view(axes: .horizontal) {
            AnyView (
                ForEach(1..<11) { _ in
                    Text("Lorem ipsum")
                        .padding()
                }
            )
        }
        assertSnapshot(matching: viewController.view, as: .image)
    }
    
}
