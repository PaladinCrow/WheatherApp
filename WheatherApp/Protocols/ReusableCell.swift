import UIKit

protocol ReusableTableViewCell: UITableViewCell {
    static var reuseIdentifier: String { get }
}

protocol ReusableCollectionViewCell: UICollectionViewCell {
    static var reuseIdentifier: String { get }
}
