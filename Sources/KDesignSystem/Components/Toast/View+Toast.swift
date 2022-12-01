import SwiftUI

public extension View {
  func toast(message: String,
             isShowing: Binding<Bool>,
             config: Toast.Config) -> some View {
    self.modifier(Toast(message: message,
                        isShowing: isShowing,
                        config: config))
  }

  func toast(message: String,
             isShowing: Binding<Bool>,
             duration: TimeInterval) -> some View {
    self.modifier(Toast(message: message,
                        isShowing: isShowing,
                        config: .init(duration: duration)))
  }
}
