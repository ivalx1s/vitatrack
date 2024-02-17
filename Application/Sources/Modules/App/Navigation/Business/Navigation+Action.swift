import Foundation

extension Navigation.Business {
    enum Action: ReluxAction {
        case setRootPage(new: Model.RootPage)
        case setMainAppPage(new: Model.MainAppPage)

        case setModalPage(new: Model.ModalPage?)
        case setModalSheet(new: Model.ModalPage?)

        case setAlert(new: Model.AlertType?)
    }
}
