import SwiftUI
import Combine

final class Toaster: ObservableObject {
  @Published var toasts: [Toast] = []
  
  // Singleton
  static let shared = Toaster()
  
  // Pirvate so it can't be instantiated because of singleton
  private init() {}
  
  /// Add a toast to toasts on the main thread.
  /// Added to the begining of the array so that that the most recent toast appearas at the top of the screen, i.e. first position
  /// - Parameter toast: A single toast
  func addToast(toast: Toast) {
    DispatchQueue.main.async {
      self.toasts.insert(toast, at: 0)
    }
  }
  
  /// Remove a toast on the main thread
  func removeToast(toastID: UUID) {
    DispatchQueue.main.async {
    self.toasts = self.toasts.filter { return $0.id != toastID }
    }
  }
}
