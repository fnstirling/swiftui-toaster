import SwiftUI
import Combine

/// Stores all toasts currently visible to user
///
/// Is a singleton to ensure only one Toaster globally lives
final class Toaster: ObservableObject {
  static let shared = Toaster()
  @Published var toasts: [Toast] = []
  
  private init() {}
  
  /// Add a toast to a collection on the main thread.
  ///
  /// Added to the begining of the array so that that the most recent toast appearas at the top of the screen, i.e. first position
  ///
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
