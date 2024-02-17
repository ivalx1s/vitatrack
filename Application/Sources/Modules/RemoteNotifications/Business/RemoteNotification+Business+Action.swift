import Foundation

extension RemoteNotification.Business {
    enum Action: ReluxAction {
        case permissionsStatusReceived(granted: Bool)
        case obtainUnreadNotificationsSuccess(notifications: [RemoteNotification.Business.Model.Notification])
        case obtainUnreadNotificationsFail

        case removeUnreadNotificationsSuccess(notifications: [RemoteNotification.Business.Model.Notification])
        case removeUnreadNotificationsFail

        case removeAllUnreadNotificationsSuccess
        case removeAllUnreadNotificationsFail
    }
}