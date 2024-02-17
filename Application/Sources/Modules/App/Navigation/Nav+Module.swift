import Foundation

extension Navigation {
    @MainActor
    final class Module: Relux.Module {
        init() {
            let state = Navigation.Business.State()
            let viewState = Navigation.UI.ViewState(navState: state)

            super.init(
                states: [state],
                viewStates: [viewState],
                sagas: []
            )
        }
    }
}