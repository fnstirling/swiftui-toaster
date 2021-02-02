import SwiftUI

@main
struct Application: App {
  @StateObject var toaster = Toaster()
  
  var body: some Scene {
    WindowGroup {
      DemoView()
        .environmentObject(toaster)
    }
  }
}
