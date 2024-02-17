import SwiftUI

extension VTApp.UI.RootContainer {
    typealias ModalPage = Navigation.Business.Model.ModalPage
    typealias AlertType = Navigation.Business.Model.AlertType
}

extension VTApp.UI {
    struct RootContainer: View {
        @Environment(\.scenePhase) private var scenePhase
        @StateObject private var navState = VTApp.relux!.appStore.getViewState(Navigation.UI.ViewState.self)

        var body: some View {
            content
       }

        @ViewBuilder
        private var content: some View {
            VStack(spacing: 0) {
                switch navState.rootPage {
                    case .initial: progress
                    case .app: app
                }
            }
                .sheet(item: $navState.modalSheet, content: modalPage)
                .fullScreenCover(item: $navState.modalPage, content: modalPage)
                .alert(item: $navState.alert, content: alert)
        }
    }
}

// modal pages
extension VTApp.UI.RootContainer {
    private func modalPage(_ type: ModalPage) -> some View {
        Group {
            switch type {
                case .debug: debug
                case .localAuthWall: localAuthWall
            }
        }
            .alert(item: $navState.alert, content: alert)
    }
}

// callbacks
extension VTApp.UI.RootContainer {
    private func handleShake() {
        performAsync {
            Navigation.Business.Action.setModalSheet(new: .debug)
        }
    }

    private func handleScenePhaseChange(new phase: ScenePhase) {
        switch phase {
            case .active:
                removeNotifications()
                reloadSensitiveData()
            case .inactive: break
            case .background: break
            @unknown default: break
        }
    }

    private func removeNotifications() {
      
    }

    private func reloadSensitiveData() {
    }
}
