import Foundation
import Swinject

    // swiftlint:disable line_length
    // swiftlint:disable file_length
    // swiftlint:disable function_body_length
    // swiftlint:disable type_body_length
@MainActor
class IoCContainer {
    public static func build() -> Container {
        let container = Container()

        reluxModule(container: container)

        remoteNotificationsModule(container: container)

        return container
    }

    private static func reluxModule(container: Container) {
        container.register(Relux.self) { (resolver: Resolver) -> Relux in
                Relux
                    .initialize(
                        appStore: Relux.Store(),
                        rootSaga: Relux.RootSaga()
                    )
                    .register(Navigation.Module())
            }
            .inObjectScope(.container)
    }

    private static func remoteNotificationsModule(container: Container) {
    }
}

// swiftlint:enable line_length
// swiftlint:enable function_body_length
// swiftlint:enable type_body_length
// swiftlint:enable file_length
