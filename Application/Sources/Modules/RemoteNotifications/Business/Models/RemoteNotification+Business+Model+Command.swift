import Foundation

extension RemoteNotification.Business.Model {
    enum Command {
        case unknown(raw: String, data: String)
    }
}