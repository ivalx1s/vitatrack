import Foundation

extension RemoteNotification.Business.Model {
    struct Notification {
        typealias Id = UUID
        let id: Id
        let date: Date
        let title: String
        let subtitle: String
        let body: String
        let type: NType
        let deepLink: URL?

        init(
            id: Id? = .init(),
            date: Date = .now,
            title: String,
            subtitle: String,
            body: String,
            type: NType,
            deepLink: URL? = nil
        ) {
            self.id = id ?? .init()
            self.date = date
            self.title = title
            self.subtitle = subtitle
            self.body = body
            self.type = type
            self.deepLink = deepLink
        }
    }
}

extension RemoteNotification.Business.Model.Notification {
    enum NType: String {
        case undefined = "undefined"
    }
}

extension RemoteNotification.Business.Model.Notification.Id {
    static func fromString(identifier: String) -> Self? {
        UUID(uuidString: identifier)
    }
}

extension RemoteNotification.Business.Model.Notification.NType: Codable {
}

extension RemoteNotification.Business.Model.Notification: Codable {
}

extension RemoteNotification.Business.Model.Notification: Equatable {
}

extension RemoteNotification.Business.Model.Notification: Identifiable {
}
