import Foundation

extension Navigation.Business {
    actor State: ReluxState {
        @Published var rootPage: Model.RootPage = .initial
        @Published var mainAppPage: Model.MainAppPage = .initial
        @Published var modalPage: Model.ModalPage?
        @Published var modalSheet: Model.ModalPage?
        @Published var alert: Model.AlertType?
        @Published var bottomNavigationVisible: Bool?

        func reduce(with action: ReluxAction) async {
            switch action as? Action {
            case .none: break
            case let .some(action): await internalReduce(with: action)
            }
        }

        func cleanup() async {
            self.rootPage = .initial
            self.mainAppPage = .initial
            self.modalPage = nil
            self.modalSheet = nil
            self.alert = nil
        }
    }
}
