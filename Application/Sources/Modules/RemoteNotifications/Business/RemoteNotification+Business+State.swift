import Foundation

extension RemoteNotification.Business {
    actor State: ReluxState {
        @Published var accessStatus: Model.AccessStatus?
        @Published var unreadNotifications: [Model.Notification] = []

        func reduce(with action: ReluxAction) async {
            switch action as? Action {
            case let .some(action): await internalReduce(with: action)
            case .none: break
            }
        }

        func cleanup() async {
            self.accessStatus = nil
        }
    }
}
