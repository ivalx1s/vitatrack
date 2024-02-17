import SwiftUI

extension VTApp.UI.RootContainer {
    func alert(_ type: AlertType) -> Alert {
        switch type {
        case let .infoAction(content):
            return Alert(
                title: Text(content.title),
                message: Text(content.message)
            )

        case let .destructiveAction(content, acceptAction):
            return Alert(
                    title: Text(content.title),
                    message: Text(content.message),
                    primaryButton: .destructive(
                            Text(acceptAction.label),
                            action: { Task { await acceptAction.callback() } }
                    ),
                    secondaryButton: .cancel()
            )

        case let .cancelAction(content, acceptAction):
            return Alert(
                    title: Text(content.title),
                    message: Text(content.message),
                    primaryButton: .default(
                            Text(acceptAction.label),
                            action: { Task { await acceptAction.callback() } }
                    ),
                    secondaryButton: .cancel()
            )
        }
    }
}

