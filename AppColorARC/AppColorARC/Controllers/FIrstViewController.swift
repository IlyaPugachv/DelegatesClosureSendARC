import UIKit

protocol DataUpdateProtocol {
    func onDataUpdate(color: UIColor, transparency: CGFloat)
}

final class FIrstViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView! { didSet {
        colorView.backgroundColor = color
        if let transparency = transparency { colorView.alpha = transparency } } }
    
    @IBOutlet weak var changedBackground: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private var color: UIColor?
    private var transparency: CGFloat?
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
        colorView.backgroundColor = color
        colorView.alpha = transparency
    }
}

