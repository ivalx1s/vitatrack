import Foundation

extension RemoteNotification.Business.State {
    func internalReduce(with action: RemoteNotification.Business.Action) async {
        switch action {
        case let .permissionsStatusReceived(granted):
            self.accessStatus = granted ? .granted : .denied

        case let .obtainUnreadNotificationsSuccess(notifications):
           self.unreadNotifications = notifications

        case .obtainUnreadNotificationsFail:
            break

        case let .removeUnreadNotificationsSuccess(notifications):
            break
        case .removeUnreadNotificationsFail:
            break

        case .removeAllUnreadNotificationsSuccess:
            self.unreadNotifications = []
        case .removeAllUnreadNotificationsFail:
            break
        }
    }
}
