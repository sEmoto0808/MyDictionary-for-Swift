
import UIKit
import STV_Extensions

final class ShopsDetailProvider: NSObject {

    let shopsDetailItems = [
        "SHOPS_DETAIL_ADDRESS".localized(),
        "SHOPS_DETAIL_TEL".localized(),
        "SHOPS_DETAIL_FAX".localized(),
        "SHOPS_DETAIL_ACCESS".localized(),
        "SHOPS_DETAIL_OPEN_TIME".localized(),
        "SHOPS_DETAIL_OPEN_DATE".localized(),
        "SHOPS_DETAIL_SEAT_COUNT".localized(),
        "SHOPS_DETAIL_PARKING".localized(),
        "SHOPS_DETAIL_CIGARETTE".localized(),
    ]
    var shop: Shop?
    
    func set(shop: Shop) {
        self.shop = shop
    }
}

// MARK: - UITableViewDataSource
extension ShopsDetailProvider: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return shopsDetailItems.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return shopsDetailItems[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShopsDetailTableViewCell.className,
                                                 for: indexPath) as! ShopsDetailTableViewCell
        
        guard let shop = shop else { return cell }
        
        switch indexPath.section {
        case 0:
            cell.textView.text = addressBuilder(shop: shop)
        case 1:
            cell.textView.text = shop.tel
        case 2:
            cell.textView.text = shop.fax
        case 3:
            cell.textView.text = shop.access
        case 4:
            cell.textView.text = shop.openTime
        case 5:
            cell.textView.text = shop.openDate
        case 6:
            cell.textView.text = shop.seatCount
        case 7:
            cell.textView.text = shop.parking
        case 8:
            cell.textView.text = shop.cigarette
            
        default:
            cell.textView.text = shop.cigarette
        }
        return cell
    }
    
}
