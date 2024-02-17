import Foundation

extension RemoteNotification.Business {
    enum Err: Error {
        case notImplemented
        case failedToGetPermissions(cause: Error)
        case failedToRegisterForPushes_notGranted
        case failedToRegisterForPushes(cause: Error)
        case failedToProcessPushWithPushSDK(content: Model.PushContent)
        case failedToUpdateAuthStatus(cause: Error)
        case failedToGetUnreadNotifications(cause: Error)
        case failedToRemoveUnreadNotifications(cause: Error)
        case failedToRemoveUnreadNotifications_notGranted
    }
}