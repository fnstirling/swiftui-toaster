import SwiftUI

protocol ToastConfigurable {
  // Colors
  static var notifySymbolColor: Color { get }
  static var dangerSymbolColor: Color { get }
  static var warningSymbolColor: Color { get }
  static var successSymbolColor: Color { get }
  
  // Symbold
  static var notifySymbolName: String { get }
  static var dangerSymbolName: String { get }
  static var warningSymbolName: String { get }
  static var successSymbolName: String { get }
}
