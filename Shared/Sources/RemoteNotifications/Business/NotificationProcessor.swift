import Foundation
import UserNotifications

protocol IRemoteNotificationProcessor {
    func process(notification: UNNotificationRequest) async -> UNNotificationContent
}

extension RemoteNotification.Business {
    actor ContentProcessor {
    }
}

extension RemoteNotification.Business.ContentProcessor: IRemoteNotificationProcessor {
    func process(notification: UNNotificationRequest) async -> UNNotificationContent {
        return notification.content 
    }
}


