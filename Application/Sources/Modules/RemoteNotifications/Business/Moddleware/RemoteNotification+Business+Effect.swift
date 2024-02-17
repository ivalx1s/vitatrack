import Foundation
import UserNotifications

extension RemoteNotification.Business {
    enum Effect: ReluxEffect {
        case checkPermissions
        case requestPermissions
        case applyPushTokens(apns: Model.APNSToken, fcm: Model.FCMToken)
        case processBackgroundPush(content: Model.PushContent)
        case makeDecisionForForegroundPush(notification: UNNotification, onShow: () -> Void)
        case reactOnPushResponse(response: UNNotificationResponse)
        case updateAuthStatus
        case obtainUnreadNotifications
        case removeUnreadNotifications(notifications: [RemoteNotification.Business.Model.Notification])
        case removeAllUnreadNotifications
    }
}