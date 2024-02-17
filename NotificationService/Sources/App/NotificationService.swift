@_exported import Logger

import UserNotifications

class NotificationService: UNNotificationServiceExtension {
    private let processor: IRemoteNotificationProcessor

    override init() {
        Self.configureModules()
        self.processor = F.get(type: IRemoteNotificationProcessor.self)!

        super.init()
    }


    override func didReceive(
        _ request: UNNotificationRequest,
        withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void
    ) {
        Task {
            contentHandler(
                await processor.process(notification: request)
            )
        }
    }

    override func serviceExtensionTimeWillExpire() {
        // Called just before the extension will be terminated by the system.
        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
    }
}

extension NotificationService {
    private static func configureModules() {
        F.initialize(with: IoCNSContainer.build())
    }
}
