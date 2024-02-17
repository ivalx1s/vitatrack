import Foundation
import Combine
import UserNotifications

protocol IRemoteNotificationSaga: ReluxSaga {}

extension RemoteNotification.Business {
    actor Saga {
    }
}

extension RemoteNotification.Business.Saga: IRemoteNotificationSaga {
    func apply(_ effect: ReluxEffect) async {
        switch effect as? RemoteNotification.Business.Effect {
        case .none: break
        case let .applyPushTokens(apns, fcm): break
        case .checkPermissions: break
        case .requestPermissions: break
        case let .processBackgroundPush(content): break
        case let .makeDecisionForForegroundPush(notification, onShow): break
        case let .reactOnPushResponse(response): break
        case .updateAuthStatus: break
        case .obtainUnreadNotifications: break
        case let .removeUnreadNotifications(notifications): break
        case .removeAllUnreadNotifications: break
        }
    }
}
