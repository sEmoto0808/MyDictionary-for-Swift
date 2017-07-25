
import UIKit
import SVProgressHUD
import Kingfisher

final class ShopsDetailViewController: UIViewController {

    // MARK: - properties
    
//    @IBOutlet weak var shopNameLabel: UILabel!
//    @IBOutlet weak var shopImage1: UIImageView!
//    @IBOutlet weak var shopDescriptionLabel: UILabel!
    @IBOutlet weak var shopInfoTableView: UITableView!
//    @IBOutlet weak var shopImage2: UIImageView!
//    @IBOutlet weak var shopImage3: UIImageView!
//    
    fileprivate let dataSource = ShopsDetailProvider()
//    /// 店舗情報取得API
//    fileprivate let shopsDetailAPI = ShopsDetailAPI()
//    /// 店舗情報取得APIステータス
//    fileprivate var shopsDetailStatus = ShopsDetailStatus.initialize
//    /// ログイン状態（true: ログイン済み, false: 未ログイン）
//    fileprivate var loggedIn = true
//    /// 店舗ID
//    var shopId = ""
    
//    // MARK: - factory
//    
//    static func create(shopId: String) -> ShopsDetailViewController {
//        
//        guard let vc = UIStoryboard.viewController(
//            storyboardName: ShopsDetailViewController.className,
//            identifier: ShopsDetailViewController.className)
//            as? ShopsDetailViewController else {
//                fatalError("unwap ShopsDetailViewController")
//        }
//        vc.shopId = shopId
//        return vc
//    }
    
//    // MARK - LifeCycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setup()
//        setupNavigationBar()
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        enabledExclusiveTouch()
//    }
}

// MARK: - fileprivate
extension ShopsDetailViewController {
    
//    func setup() {
//        SVProgressHUD.fp.show()
//        shopsDetailAPI.loadable = self
//        shopsDetailAPI.load(shopId: shopId, loggedIn: loggedIn)
//    }
    
    func reloadView(shop: Shop) {
        
        if let imagePath1 = shop.shopImage.first?.imagePath,
            let url = URL(string: imagePath1) {
            shopImage1.kf.setImage(with: url)
        }
        
        if let imagePath2 = shop.shopImage[safe: 1]?.imagePath,
            let url = URL(string: imagePath2) {
            shopImage2.kf.setImage(with: url)
        }
        
        if let imagePath3 = shop.shopImage[safe: 2]?.imagePath,
            let url = URL(string: imagePath3) {
            shopImage3.kf.setImage(with: url)
        }
        
        dataSource.set(shop: shop)
        shopInfoTableView.dataSource = dataSource
        shopInfoTableView.reloadData()
    }
    
//    // MARK: - actions
//    @IBAction func didTapConfirmPassport(_ sender: Any) {
//        if loggedIn {
//            let vc = PassportListsViewController.create(shopId: shopId)
//            navigationController?.pushViewController(vc, animated: true)
//        } else {
//            let vc = LoginViewController.create()
//            navigationController?.pushViewController(vc, animated: true)
//        }
//    }
}

//// MARK: - ShopsDetailLoadable
//extension ShopsDetailViewController: ShopsDetailLoadable {
//    func setResult(result: ShopsDetailStatus) {
//        
//        shopsDetailStatus = result
//        SVProgressHUD.dismiss()
//        
//        switch result {
//        case .loaded(let response):
//            
//            reloadView(shop: response)
//            
//        case .error(message: let message):
//            // TODO: エラーハンドリング仕様確定次第修正
//            Logger.debug(message: message)
//            
//        default:
//            // TODO: エラーハンドリング仕様確定次第修正
//            Logger.debug(message: "default")
//        }
//    }
//}
