import Foundation

extension Navigation.Business.Model {
    enum ModalPage {
        case debug
        case localAuthWall
    }
}

extension Navigation.Business.Model.ModalPage: Identifiable {
    var id: String {
        switch self {
        case .debug: return "debug"
        case .localAuthWall: return "localAuthWall"
        }
    }
}
