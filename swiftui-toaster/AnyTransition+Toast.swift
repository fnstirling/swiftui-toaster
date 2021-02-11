import SwiftUI

extension AnyTransition {
  /// Fade and slide in and out transition for a Toast
  static var toast: AnyTransition {
    let insertion = AnyTransition
      .move(edge: .top)
      .combined(with: .opacity)
      .animation(Animation.easeOut(duration: 0.3))
  
    let removal = AnyTransition
      .move(edge: .top)
      .combined(with: .opacity)
      .animation(Animation.easeOut(duration: 0.5))
    
    return .asymmetric(insertion: insertion, removal: removal)
  }
}
