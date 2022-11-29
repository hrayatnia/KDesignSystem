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
