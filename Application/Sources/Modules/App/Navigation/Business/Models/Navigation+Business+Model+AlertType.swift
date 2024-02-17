import Foundation

extension Navigation.Business.Model {
    enum AlertType {
        case destructiveAction(content: Content, yes: Action)
        case cancelAction(content: Content, yes: Action)
        case infoAction(content: Content)
    }
}

extension Navigation.Business.Model.AlertType: Identifiable {}

extension Navigation.Business.Model.AlertType {
    struct Content: Identifiable {
        let title: String
        let message: String

        var id: Int {
            title.hashValue
        }
    }

    struct Action {
        let label: String
        let callback: () async -> ()
    }

    var id: Int {
        switch self {
        case let .cancelAction(content, _): return content.id
        case let .destructiveAction(content, _): return content.id
        case let .infoAction(content): return content.id
        }
    }
}
