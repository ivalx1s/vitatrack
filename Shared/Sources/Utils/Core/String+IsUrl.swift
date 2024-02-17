import Foundation
import UIKit

extension String {
    var isUrl: Bool {
        if let url = URL(string: self) {
            // Check if the URL scheme is not empty (e.g., http, https, ftp)
            return url.scheme != nil
        }
        return false
    }
}
