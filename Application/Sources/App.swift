@_exported import Logger
@_exported import Relux

import SwiftUI

@main
@MainActor
struct VTApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate

    let relux: Relux
    static var relux: Relux?

    init() {
        Self.configureModules()
        relux = F.get(type: Relux.self)!
        Self.relux = relux

        configureAppearance()

        setupAppContext()
    }

    var body: some Scene {
        WindowGroup {
            VTApp.UI.RootContainer()
        }
    }

    static private func configureModules() {
        F.initialize(with: IoCContainer.build())
    }

    private func setupAppContext() {
        performAsync {
            Navigation.Business.Action.setRootPage(new: .app)
        }
    }

    private func configureAppearance() {
        let tintColor = UIColor(.green)
        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = tintColor

        UITextView.appearance().backgroundColor = .clear
        UITableView.appearance().backgroundColor = .clear
        UIPickerView.appearance().backgroundColor = .clear
        UIPickerView.appearance().tintColor = .red
    }
}
