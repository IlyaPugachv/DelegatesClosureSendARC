import UIKit

protocol DataUpdateProtocol {
    func onDataUpdate(color: UIColor, transparency: CGFloat)
}

class FIrstViewController: UIViewController {
    
    @IBOutlet weak var ColorView: UIView! { didSet {
        ColorView.backgroundColor = color
        if let transparency = transparency { ColorView.alpha = transparency } } }
    
    @IBOutlet weak var changedBackground: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    var color: UIColor?
    var transparency: CGFloat?
    var handler: (() -> ())?
    var delegate: DataUpdateProtocol?
    
    @IBAction func ChangeBGAction() {
        let stor = UIStoryboard(name: "Main", bundle: nil)
        guard let secondViewController = stor.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        
        secondViewController.delegate = self
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    private func setupUI() {
        changedBackground.backgroundColor = .white
        changedBackground.layer.cornerRadius = 12
    }
}

extension FIrstViewController: DataUpdateProtocol {
    func onDataUpdate(color: UIColor, transparency: CGFloat) {
        ColorView.backgroundColor = color
        ColorView.alpha = transparency
    }
}

