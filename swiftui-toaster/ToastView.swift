import SwiftUI

/// A view for an individual toast
struct ToastView: View {
  var text: String
  var symbolName: String
  var symbolColor: Color
  var removal: () -> Void
  var work: DispatchWorkItem? // Store the removal in a work item so can be cancelled if tapped to remove
  
  var verticalSpacing: CGFloat = 15
  var singleHorizontalSpacing: CGFloat = 40
  var symbolWidth: CGFloat = 22
  var textLeadingPadding: CGFloat = 10
  var nonTextWidth: CGFloat { (singleHorizontalSpacing * 2) + symbolWidth } // Multipled by 3 for 1 x symbol space and 2 x edge spacings
  var toastHeight: CGFloat = 60
  var duration: Int = 3000
  
  init(
    text: String,
    symbolName: String,
    symbolColor: Color,
    removal: @escaping () -> Void
  ) {
    self.text = text
    self.symbolName = symbolName
    self.symbolColor = symbolColor
    self.removal = removal
    self.work = DispatchWorkItem(block: { removal() })
    
    if let work = work {
      DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(duration), execute: work)
    }
  }
  
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
            .font(.system(size: 14, weight: .semibold))
            .frame(width: geometry.size.width - nonTextWidth, height: toastHeight, alignment: .leading)
            .padding(.leading, textLeadingPadding)
            .lineLimit(2)
          
          Spacer().frame(width: singleHorizontalSpacing, height: toastHeight)
        }
        .frame(width: geometry.size.width)
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .stroke(Color(UIColor.systemFill), lineWidth: 1)
        )
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(12)
        // .shadow(color: Color(UIColor.systemGroupedBackground), radius: 5, x: 0, y: 0)
      }
    }
    .frame(height: toastHeight, alignment: .top)
    .onTapGesture {
      work?.cancel()
      removal()
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
