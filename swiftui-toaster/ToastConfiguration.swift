import SwiftUI

public struct ToastConfiguration: ToastConfigurable {
  // Symbol names
  public static var notifySymbolName: String = "bell.circle.fill"
  public static var dangerSymbolName: String = "xmark.circle.fill"
  public static var warningSymbolName: String = "exclamationmark.triangle.fill"
  public static var successSymbolName: String = "checkmark.circle.fill"
  // Symbol colors
  public static var notifySymbolColor: Color = Color(UIColor.systemGray)
  public static var dangerSymbolColor: Color = .red
  public static var warningSymbolColor: Color = .orange
  public static var successSymbolColor: Color = .green
}
