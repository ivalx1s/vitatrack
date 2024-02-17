import Foundation
import UserNotifications

extension RemoteNotification.Business.Model {
    struct GenericContent {
        let title: String
        let subtitle: String
        let body: String
        let userData: NSDictionary

        init(notification: UNNotification) {
            self.init(notification: notification.request.content)
        }

        init(notification: UNNotificationContent) {
            self.title = notification.title
            self.subtitle = notification.subtitle
            self.body = notification.body
            self.userData = notification.userInfo as NSDictionary
        }
    }
}

extension NSDictionary {
    func getField<T>(name: String) -> T? {
        guard let field = self[name] else { return nil }
        return field as? T
    }
}