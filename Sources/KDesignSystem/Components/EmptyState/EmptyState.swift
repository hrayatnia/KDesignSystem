import SwiftUI

public struct EmptyStateViewModifier<EmptyContent>: ViewModifier where EmptyContent: View {
    private var isEmpty: Bool
    private let emptyContent: () -> EmptyContent
    
    public init(isEmpty: Bool, emptyContent: @escaping () -> EmptyContent) {
        self.isEmpty = isEmpty
        self.emptyContent = emptyContent
    }
    
    public func body(content: Content) -> some View {
        if isEmpty {
            emptyContent()
        }
        else {
            content
        }
    }
}

public extension View {
    func emptyState<EmptyContent>(_ isEmpty: Bool,
                                emptyContent: @escaping () -> EmptyContent) -> some View where EmptyContent: View {
    modifier(EmptyStateViewModifier(isEmpty: isEmpty, emptyContent: emptyContent))
  }
}
