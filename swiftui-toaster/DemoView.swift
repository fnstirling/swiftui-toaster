import SwiftUI

struct DemoView: View {
  @EnvironmentObject var toaster: Toaster
  @State var disabled: Bool = false
  
  var body: some View {
    VStack {
      Spacer()
      Text("Tap the button to create a toast")
        .padding()
      Spacer()
      Button(
        action: {
          toaster.addToast(
            toast: Toast(
              text: "Toast \(toaster.toasts.count)",
              intent: .notify
            )
          )
        }
      ) {
        HStack {
          Spacer()
          Text("Create Toast")
            .font(.system(size: 15))
            .fontWeight(.semibold)
            .foregroundColor(.white)
          Spacer()
        }
        .frame(height: 50, alignment: .center)
        .background(Color.blue)
        .opacity(disabled ? 0.5 : 1.0)
        .cornerRadius(10)
      }
      .disabled(disabled)
      .padding(.horizontal, 20)
    }
    .overlay(ToasterView())
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let toaster = Toaster(
      toasts: [
        Toast(text: "Toast 1", intent: .notify),
        Toast(text: "Toast 2", intent: .notify),
      ]
    )
    let view = DemoView()
    
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
