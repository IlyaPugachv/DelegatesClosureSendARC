import UIKit

protocol DataUpdateProtocol {
    func onDataUpdate(data: String)
}

class FIrstViewController: UIViewController {
    
    @IBOutlet weak var ColorView: UIView!
    @IBOutlet weak var Button: UIButton!
    
    
    @IBAction func ChangeBGAction() {
        let stor = UIStoryboard(name: "Main", bundle: nil)
        guard let secondViewController = stor.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        
        secondViewController.delegate = self
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}

extension FIrstViewController: DataUpdateProtocol {
    func onDataUpdate(data: String) {
        //
    }
}
