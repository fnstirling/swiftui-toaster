import SwiftUI

/// An individual toast to display to the user
final class Toast {
  let id: UUID
  var text: String
  var intent: Toast.Intent
  var symbolName: String
  var symbolColor: Color
  
  init(
    text: String,
    intent: Toast.Intent
  ) {
    self.id = UUID()
    self.text = text
    self.intent = intent
    switch intent {
    case .notify, .custom:
      self.symbolName = ToastConfiguration.notifySymbolName
      self.symbolColor = ToastConfiguration.notifySymbolColor
    case .danger:
      self.symbolName = ToastConfiguration.dangerSymbolName
      self.symbolColor = ToastConfiguration.dangerSymbolColor
    case .warning:
      self.symbolName = ToastConfiguration.warningSymbolName
      self.symbolColor = ToastConfiguration.warningSymbolColor
    case .success:
      self.symbolName = ToastConfiguration.successSymbolName
      self.symbolColor = ToastConfiguration.successSymbolColor
    }
  }
  
  init(
    text: String,
    symbolName: String,
    symbolColor: Color
  ) {
    self.id = UUID()
    self.text = text
    self.intent = .custom
    self.symbolName = symbolName
    self.symbolColor = symbolColor
  }
  
  public enum Intent: String {
    case notify
    case danger
    case warning
    case success
    case custom
  }
}

extension Toast: Identifiable {}

extension Toast: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(ObjectIdentifier(self).hashValue)
  }
  
  static func == (lhs: Toast, rhs: Toast) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
  }
}
