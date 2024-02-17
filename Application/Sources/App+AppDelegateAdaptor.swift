import SwiftUI

class AppDelegate: NSObject {
    private let notificationCenter = UNUserNotificationCenter.current()

    override init() {
        super.init()
    }
}

extension AppDelegate: UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        log(">>> application launchOptions")
        return true
    }

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        log(">>> application didFinishLaunchingWithOptions")
        registerForRemoteNotifications()

        return true
    }

    func application(
        _ application: UIApplication,
        didReceiveRemoteNotification userInfo: [AnyHashable: Any],
        fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void
    ) {

        log(">>>> application didReceiveRemoteNotification in bg: \(userInfo)")
        Task { @MainActor in
            await action {
                RemoteNotification.Business.Effect.processBackgroundPush(content: userInfo)
            }
            completionHandler(UIBackgroundFetchResult.newData)
        }
    }

    func application(
        _ application: UIApplication,
        continue userActivity: NSUserActivity,
        restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void
    ) -> Bool {
        log("application restorationHandler userActivity: \(userActivity)")
        return true
    }

    private func registerForRemoteNotifications() {
        UNUserNotificationCenter.current().delegate = self
        UIApplication.shared.registerForRemoteNotifications()
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
      //  Messaging.messaging().apnsToken = deviceToken
        let encryptedToken = [UInt8](deviceToken).map { String(format: "%02x", $0) }.joined()
        log(">>>> didRegisterForRemoteNotificationsWithDeviceToken: \(encryptedToken)")
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        log(">>>> didFailToRegisterForRemoteNotificationsWithError")
    }

    // handles push appearance in notification console if app is opened
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        let userInfo = notification.request.content.userInfo
        log(">>>> AD: userNotificationCenter willPresent: \(userInfo)")

        Task {
            await actions {
                RemoteNotification.Business.Effect.makeDecisionForForegroundPush(
                    notification: notification,
                    onShow: {
                        Task { @MainActor in
                            completionHandler([[.banner, .badge, .sound]])
                        }
                    }
                )
            }
        }

    }

    // handles app opening with push
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        let userInfo = response.notification.request.content.userInfo

        log(">>>> AD: userNotificationCenter didReceive: \(userInfo)")

        Task { @MainActor in
            await actions {
                RemoteNotification.Business.Effect.reactOnPushResponse(response: response)
            }
            completionHandler()
        }
    }
}
