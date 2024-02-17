import SwiftUI

extension VTApp.UI.RootContainer {
    @ViewBuilder
    func tip(for type: TipType) -> some View {
        switch type {
        case let .bottomSheet(props):
            BottomSheetTip(
                props: props,
                actions: .init(
                    onClose: {
                        await action {
                            Navigation.Business.Action.setModalOverlay(new: .none)
                        }
                    }
                )
            )
        }
    }
}
