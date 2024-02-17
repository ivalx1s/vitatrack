import Foundation
import Swinject

class IoCNSContainer {
    public static func build() -> Container {
        let container = Container()

        remoteNotificationsManagementModule(container: container)

        return container
    }


    private static func remoteNotificationsManagementModule(container: Container) {
        container.register(IRemoteNotificationProcessor.self) { (resolver: Resolver) -> IRemoteNotificationProcessor in
                RemoteNotification.Business.ContentProcessor()
            }
            .inObjectScope(.container)
    }
}
