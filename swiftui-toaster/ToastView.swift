import SwiftUI

struct ToastView: View {
  // MARK: Properties
  var text: String
  var symbolName: String
  var symbolColor: Color
  var removal: () -> Void
  
  // MARK: Default Properties
  var verticalSpacing: CGFloat = 15
  var singleHorizontalSpacing: CGFloat = 40
  var symbolWidth: CGFloat = 25
  var textLeadingPadding: CGFloat = 10
  var nonTextWidth: CGFloat { (singleHorizontalSpacing * 2) + symbolWidth } // Multipled by 3 for 1 x symbol space and 2 x edge spacings
  var toastHeight: CGFloat = 60
  
  var body: some View {
    GeometryReader { geometry in
      HStack {
        HStack(spacing: 0) {
          Spacer().frame(width: singleHorizontalSpacing, height: toastHeight)
          
          Image(systemName: symbolName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: symbolWidth, height: symbolWidth)
            .foregroundColor(symbolColor)
          
          Text(text)
            .font(.system(size: 16, weight: .semibold))
            .frame(width: geometry.size.width - nonTextWidth, height: toastHeight, alignment: .leading)
            .padding(.leading, textLeadingPadding)
            .lineLimit(2)
          
          Spacer().frame(width: singleHorizontalSpacing, height: toastHeight)
        }
        .frame(width: geometry.size.width)

        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(12)
        .shadow(color: Color(UIColor.systemGroupedBackground), radius: 5, x: 0, y: 0)
      }
    }
    .frame(height: toastHeight, alignment: .top)
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(3000)) { removal() }
    }
  }
}

struct ToastView_Previews: PreviewProvider {
  static var previews: some View {
    let view = ToastView(
      text: "This is a toast. This toast has alot of text that will go over 2 lines. But it won't go to 3 lines",
      symbolName: ToastConfiguration.notifySymbolName,
      symbolColor: ToastConfiguration.notifySymbolColor,
      removal: {}
    )
    
    Group {
      view
        .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
        .previewDisplayName("iPhone 11 Pro")
        .environment(\.colorScheme, .light)
      
      view
        .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
        .previewDisplayName("iPhone 11 Pro")
        .environment(\.colorScheme, .dark)
    }
  }
}
