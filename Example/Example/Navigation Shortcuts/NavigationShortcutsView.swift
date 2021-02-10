import ComposableArchitecture
import ComposableNavigator
import SwiftUI

struct NavigationShortcutsState: Equatable {}

enum NavigationShortcutsAction: Equatable {
  case viewAppeared
}

struct NavigationShortcutsEnvironment {
  let navigator: Navigator
}

struct NavigationShortcutsScreen: Screen {
  let presentationStyle: ScreenPresentationStyle

  static func builder(
    store: Store<NavigationShortcutsState, NavigationShortcutsAction>
  ) -> some PathBuilder {
    PathBuilders.screen( // settings
      content: { (screen: Self) in
        NavigationShortcutsView(store: store)
      }
    )
  }
}

let navigationShortcutsReducer = Reducer<
  NavigationShortcutsState,
  NavigationShortcutsAction,
  NavigationShortcutsEnvironment
>.empty

struct NavigationShortcutsView: View {
  @Environment(\.navigator) var navigator
  let store: Store<NavigationShortcutsState, NavigationShortcutsAction>

  var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: 16) {
        NavigationShortcuts()
        Spacer()
      }
      Spacer()
    }
    .padding(16)
    .navigationTitle(Text("Navigation Shortcuts"))
  }
}

struct NavigationShortcutsView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationShortcutsView(
      store: Store(
        initialState: NavigationShortcutsState(),
        reducer: .empty,
        environment: ()
      )
    )
  }
}
