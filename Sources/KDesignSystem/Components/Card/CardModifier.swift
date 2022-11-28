import SwiftUI

public struct CardModifier: ViewModifier {
    
    private let radius: Double
    private let shadowColor: Color
    private let shadowRadius: Double
    private let shadowX: Double
    private let shadowY: Double
    
    public init(radius: Double = 4.0,
         shadow shadowColor: Color = .gray.opacity(0.15),
         shadowRadius: Double = 12,
         shadowX: Double = 4,
         shadowY: Double = 4.0 ) {
        self.radius = radius
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.shadowX = shadowX
        self.shadowY = shadowY
    }
    
    public func body(content: Content) -> some View {
        content
            .cornerRadius(radius)
            .shadow(color: shadowColor,
                    radius: shadowRadius,
                    x: shadowX,
                    y: shadowY)
    }

}
