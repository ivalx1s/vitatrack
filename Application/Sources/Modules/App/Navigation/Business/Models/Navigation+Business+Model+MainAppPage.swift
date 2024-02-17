import Foundation

extension Navigation.Business.Model {
    enum MainAppPage {
        case initial
        case onboarding
        case app
    }
}

extension Navigation.Business.Model.MainAppPage: Equatable {
}
