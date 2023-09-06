import UIKit

protocol DataUpdateProtocol {
    func onDataUpdate(data: String)
}

class FIrstViewController: UIViewController {
    
    @IBOutlet weak var ColorView: UIView!
    @IBOutlet weak var Button: UIButton!
    
    
    @IBAction func ChangeBGAction() {
    }
    
    
    }

extension FIrstViewController: DataUpdateProtocol {
    func onDataUpdate(data: String) {
        //
    }
}
