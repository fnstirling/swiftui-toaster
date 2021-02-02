import SwiftUI

final class Toast {
  let id: UUID
  var text: String
  var intent: Toast.Intent
  var symbol: Toast.Symbol
  var color: Color
  
  init(
    text: String,
    intent: Toast.Intent = .notify
  ) {
    self.id = UUID()
    self.text = text
    self.intent = intent
    switch intent {
    case .success:
      self.color = .green
      self.symbol = .check
    case .error:
      self.color = .red
      self.symbol = .xmark
    case .warning:
      self.color = .orange
      self.symbol = .exclamation
    case .notify:
      self.color = Color(UIColor.systemGray)
      self.symbol = .bell
    }
  }
  
  init(
    text: String,
    intent: Toast.Intent,
    symbol: Toast.Symbol,
    color: Color
  ) {
    self.id = UUID()
    self.text = text
    self.intent = intent
    self.symbol = symbol
    self.color = color
  }
  
  public enum Intent: String {
    case success
    case notify
    case error
    case warning
  }
  
  public enum Symbol: String {
    case check = "checkmark.circle.fill"
    case exclamation = "exclamationmark.triangle.fill"
    case xmark = "xmark.circle.fill"
    case bell = "bell.circle.fill"
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
