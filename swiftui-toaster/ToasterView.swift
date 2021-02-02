import SwiftUI

struct ToasterView: View {
  @EnvironmentObject var toaster: Toaster
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
            symbolName: toast.symbol.rawValue,
            removal: { toaster.removeToast(toastID: toast.id) }
          )
          // .offset(x: 0, y: currentOffset)
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
    let toaster = Toaster(
      toasts: [
        Toast(text: "Toast 1"),
        Toast(text: "Toast 2")
      ]
    )
    let view = ToasterView()
    
    Group {
      view
        .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
        .previewDisplayName("iPhone 11 Pro")
        .environment(\.colorScheme, .light)
        .environmentObject(toaster)
      
      view
        .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
        .previewDisplayName("iPhone 11 Pro")
        .environment(\.colorScheme, .dark)
        .environmentObject(toaster)
    }
  }
}
