import SwiftUI

@main
struct Application: App {
  @StateObject var toastStore = Toaster()
  
  var body: some Scene {
    WindowGroup {
      DemoView()
        .environmentObject(toastStore)
    }
  }
}
