import Foundation

extension Navigation.Business.Model {
    enum RootPage {
        case initial
        case app
    }
}

extension Navigation.Business.Model.RootPage {
}

extension Navigation.Business.Model.RootPage: Equatable {
}

extension Navigation.Business.Model.RootPage {
    enum AuthState {
        case initial
        case inProgress
        case logoutInProgress
    }
}
