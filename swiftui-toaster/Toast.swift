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
    case .notify:
      self.color = Color(UIColor.systemGray)
      self.symbol = .notify
    case .danger:
      self.color = .red
      self.symbol = .danger
    case .warning:
      self.color = .orange
      self.symbol = .warning
    case .success:
      self.color = .green
      self.symbol = .success
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
    case notify
    case danger
    case warning
    case success
  }
  
  public enum Symbol: String {
    case notify = "bell.circle.fill"
    case danger = "xmark.circle.fill"
    case warning = "exclamationmark.triangle.fill"
    case success = "checkmark.circle.fill"
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
