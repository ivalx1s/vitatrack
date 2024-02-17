import Foundation

extension Navigation.Business.State {
    func internalReduce(with action: Navigation.Business.Action) async {
        switch action {

        case let .setRootPage(new):
            self.rootPage = new
        case let .setMainAppPage(new):
            self.mainAppPage = new

        case let .setModalPage(new):
            self.modalPage = new
        case let .setModalSheet(new):
            self.modalSheet = new

        case let .setAlert(new):
            self.alert = new
        }
    }
}
