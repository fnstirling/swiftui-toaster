import SwiftUI

/// Protocol for the toast configuration
protocol ToastConfigurable {
  // Symbol name
  static var notifySymbolName: String { get }
  static var dangerSymbolName: String { get }
  static var warningSymbolName: String { get }
  static var successSymbolName: String { get }
  
  // Symbol colors
  static var notifySymbolColor: Color { get }
  static var dangerSymbolColor: Color { get }
  static var warningSymbolColor: Color { get }
  static var successSymbolColor: Color { get }
}
