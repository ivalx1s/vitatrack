import Foundation

extension RemoteNotification.UI {
	@MainActor
	class ViewState: ReluxViewState {
		@Published var accessStatus: RemoteNotification.Business.Model.AccessStatus?
		@Published var unreadNotifications: [RemoteNotification.Business.Model.Notification] = []

		init(remoteNotificationState: RemoteNotification.Business.State) {
			Task {
				await initPipelines(remoteNotificationState: remoteNotificationState)
			}
		}

		private func initPipelines(remoteNotificationState: RemoteNotification.Business.State) async {
			await remoteNotificationState.$accessStatus
				.receive(on: mainQueue)
				.assign(to: &$accessStatus)

			await remoteNotificationState.$unreadNotifications
				.receive(on: mainQueue)
				.assign(to: &$unreadNotifications)
		}
	}
}
