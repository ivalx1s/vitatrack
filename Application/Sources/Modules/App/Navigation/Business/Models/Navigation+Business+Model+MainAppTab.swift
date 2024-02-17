import Foundation

extension Navigation.Business.Model {
    enum MainAppTab {
        case kids
        case account
    }
}
extension Navigation.Business.Model.MainAppTab: Identifiable {
    var id: String {
        switch self {
            case .kids: return "kids"
            case .account: return "account"
        }
    }
}

