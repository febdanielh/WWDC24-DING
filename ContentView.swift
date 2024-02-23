import SwiftUI

enum DisplayScreen {
    case mainMenu
    case allView
    case practiceView
}

struct ContentView: View {
    @EnvironmentObject var vm: ViewModel
    var body: some View {
        switch vm.currentDisplayScreen {
        case .mainMenu:
            MainMenu()
        case .allView:
            AllGlassView()
        case .practiceView:
            PracticeView()
        }
    }
}
