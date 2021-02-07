import SwiftUI

struct ToasterView: View {
  @ObservedObject var toaster: Toaster = Toaster.shared
  private let animation: Animation = Animation.easeOut(duration: 0.3)
  private var screenSize: CGSize {
    #if os(iOS) || os(tvOS)
    return UIScreen.main.bounds.size
    #elseif os(watchOS)
    return WKInterfaceDevice.current().screenBounds.size
    #else
    return NSScreen.main?.frame.size ?? .zero
    #endif
  }
  
  var body: some View {
    VStack {
      ForEach(toaster.toasts, id: \.self) { toast in
          ToastView(
            text: toast.text,
            symbolName: toast.symbolName,
            symbolColor: toast.symbolColor,
            removal: { toaster.removeToast(toastID: toast.id) }
          )
          .offset(x: 0, y: 0)
          .animation(animation)
          .transition(.toast)
      }
      Spacer()
    }
    .padding(.horizontal, 10)
  }
}

struct ToasterView_Previews: PreviewProvider {
  static var previews: some View {
    let view = ToasterView()
    
    Group {
      view
        .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
        .previewDisplayName("iPhone 11 Pro")
        .environment(\.colorScheme, .light)
      
      view
        .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
        .previewDisplayName("iPhone 11 Pro")
        .background(Color(UIColor.systemBackground))
        .environment(\.colorScheme, .dark)
    }
  }
}
