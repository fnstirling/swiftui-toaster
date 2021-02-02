import SwiftUI

protocol ToastConfigurable {
  // Colors
  var notifySymbolColor: Color { get }
  var dangerSymbolColor: Color { get }
  var warningSymbolColor: Color { get }
  var successSymbolColor: Color { get }
  
  // Symbold
  var notifySymbolName: String { get }
  var dangerSymbolName: String { get }
  var warningSymbolName: String { get }
  var successSymbolName: String { get }
}
