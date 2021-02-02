import SwiftUI

struct DemoView: View {
  @EnvironmentObject var toaster: Toaster
  @State var disabled: Bool = false
  
  var body: some View {
    VStack {
      Text("Toaster Demo")
        .font(.headline)
        .padding()
      Spacer()
      VStack(spacing: 5) {
        DemoButton(text: "Delete Youngest Toast", backgroundColor: .red) {
          if toaster.toasts.count > 0 {
            toaster.toasts.removeFirst()
          }
        }
        
        DemoButton(text: "Delete Oldest Toast", backgroundColor: .red) {
          if toaster.toasts.count > 0 {
           toaster.toasts.removeLast()
          }
        }.padding(.bottom, 25)
        
        DemoButton(text: "Create Danger Toast", backgroundColor: .red) {
          toaster.addToast(
            toast: Toast(
              text: "Toast \(toaster.toasts.count)",
              intent: .danger
            )
          )
        }
        
        DemoButton(text: "Create Warning Toast", backgroundColor: .orange) {
          toaster.addToast(
            toast: Toast(
              text: "Toast \(toaster.toasts.count)",
              intent: .warning
            )
          )
        }
        
        DemoButton(text: "Create Success Toast", backgroundColor: .green) {
          toaster.addToast(
            toast: Toast(
              text: "Toast \(toaster.toasts.count)",
              intent: .success
            )
          )
        }
        
        DemoButton(text: "Create Notify Toast", backgroundColor: .blue) {
          toaster.addToast(
            toast: Toast(
              text: "Toast \(toaster.toasts.count)",
              intent: .notify
            )
          )
        }
      }
    }
    .overlay(ToasterView())
  }
}

struct DemoButton: View {
  let text: String
  let backgroundColor: Color
  let action: () -> Void
  
  var body: some View {
    Button(
      action: action
    ) {
      HStack {
        Spacer()
        Text(text)
          .font(.system(size: 15))
          .fontWeight(.semibold)
          .foregroundColor(.white)
        Spacer()
      }
      .frame(height: 50, alignment: .center)
      .background(backgroundColor)
      .cornerRadius(10)
    }
    .padding(.horizontal, 20)
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
        .background(Color(UIColor.systemBackground))
        .environment(\.colorScheme, .dark)
        .environmentObject(toaster)
    }
  }
}
