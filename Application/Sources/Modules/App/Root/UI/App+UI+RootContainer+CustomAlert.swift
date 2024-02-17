import SwiftUI

extension VTApp.UI.RootContainer {
    @ViewBuilder
 
    private func closeOverlay() async {
        await action {
            Navigation.Business.Action.setModalOverlay(new: .none)
        }
    }
}
