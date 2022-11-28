import KCTestUtil
import SnapshotTesting
import XCTest
import SwiftUI

class SnapshotBaseTestCase: XCScreenshotTestCase {
//    #if os(iOS) || os(watchOS) || os(tvOS)
//        var viewController: UIHostingController<Content>!
//    #elseif os(macOS)
//        var viewController: NSHostingController!
//    #endif
    
    override func setUpWithError() throws {
        loadConfig()
        isRecording = (KCTestUtilStorage.properties["isRecording"] as? Bool) ?? false
        try super.setUpWithError()
    }
    
    
}
