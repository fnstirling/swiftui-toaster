import SwiftUI
import Combine

final class Toaster: ObservableObject {
  @Published var toasts: [Toast]
  
  init(
    toasts: [Toast] = []
  ) {
    self.toasts = toasts
  }
  
  /// Add a toast to toasts at the begining so that the most recent toast appearas at the top of the screen
  func addToast(toast: Toast) {
    // self.toasts.append(toast)
    self.toasts.insert(toast, at: 0)
  }
  
  /// Add a toast to toasts
  func removeToast(toastID: UUID) {
    self.toasts = self.toasts.filter { return $0.id != toastID }
  }
}
