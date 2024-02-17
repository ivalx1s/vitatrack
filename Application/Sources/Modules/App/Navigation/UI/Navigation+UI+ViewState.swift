import Combine

extension Navigation.UI.ViewState {
    typealias Models = Navigation.Business.Model
}

extension Navigation.UI {
    @MainActor
    class ViewState: ReluxViewState {
        private var pipelines: Set<AnyCancellable> = []

        @Published private(set) var rootPage: Models.RootPage = .initial
        @Published var mainAppPage: Models.MainAppPage = .initial
        @Published var modalPage: Models.ModalPage?
        @Published var modalSheet: Models.ModalPage?
        @Published var alert: Models.AlertType?

        init(
            navState: Navigation.Business.State
        ) {
            Task { [weak self] in
                await self?.initPipelines(with: navState)
            }
        }
    }
}

extension Navigation.UI.ViewState {
    private func initPipelines(with navState: Navigation.Business.State) async {


        await navState.$rootPage
            .receive(on: mainQueue)
            .assign(to: &$rootPage)

        await navState.$mainAppPage
            .compactMap { $0 }
            .receive(on: mainQueue)
            .assign(to: &$mainAppPage)



        await navState.$modalPage
            .receive(on: mainQueue)
            .assign(to: &$modalPage)

        await navState.$modalSheet
            .receive(on: mainQueue)
            .assign(to: &$modalSheet)

        await navState.$alert
            .receive(on: mainQueue)
            .assign(to: &$alert)
    }
}

extension Navigation.UI.ViewState {
    nonisolated
    static func mapBottomNavVisibility(visible: Bool?) -> Bool {
        visible ?? true
    }
}
