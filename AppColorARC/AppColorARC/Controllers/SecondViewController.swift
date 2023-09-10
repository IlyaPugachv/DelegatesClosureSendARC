import UIKit
import Foundation

class SecondViewController: UIViewController {
    
    // MARK: - IBOutlet RED
    @IBOutlet  weak var hsRed: UISlider!
    @IBOutlet  weak var tfRed: UITextField!
    
    // MARK: - IBOutlet GREEN
    @IBOutlet private weak var hsGreen: UISlider!
    @IBOutlet private weak var tfGreen: UITextField!
    
    // MARK: - IBOutlet BLUE
    @IBOutlet private weak var hsBlue: UISlider!
    @IBOutlet private weak var tfBlue: UITextField!
    
    // MARK: - IBOutlet COLOR TEXT FIELD
    @IBOutlet private weak var tfHerColor: UITextField!
    
    // MARK: - IBOutlet OPARACITY
    @IBOutlet private weak var hsOpacity: UISlider!
    @IBOutlet private weak var tfOpacity: UITextField!
    
    // MARK: - IBOutlet COLORVIEW
    @IBOutlet private weak var colorView: UIView!
    
    // MARK: - IBOutlet DONEBUTTON
    @IBOutlet private weak var delegateBtn: UIButton!
    @IBOutlet private weak var closureBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    var delegate: DataUpdateProtocol?
    
    @IBAction func hsRedAction(_ sender: UISlider) {
        let redValue = Int(round(hsRed.value))
        tfRed.text = String(redValue)
        
        let color = rgbToHex(red: redValue, green: Int(hsGreen.value), blue: Int(hsBlue.value))
        tfHerColor.text = color
        colorVIew()
    }
    
    @IBAction func hsGreenAction(_ sender: UISlider) {
        let greenValue = Int(round(hsGreen.value))
        tfGreen.text = String(greenValue)
        
        let color = rgbToHex(red: Int(hsRed.value), green: greenValue, blue: Int(hsBlue.value))
        tfHerColor.text = color
        colorVIew()
    }
    
    @IBAction func hsBlueAction(_ sender: UISlider) {
        let blueValue = Int(round(hsBlue.value))
        tfBlue.text = String(blueValue)
        
        let color = rgbToHex(red: Int(hsRed.value), green: Int(hsGreen.value), blue: blueValue)
        tfHerColor.text = color
        colorVIew()
    }
    
    @IBAction func opacityHSAction(_ sender: UISlider) {
        let value = Int(sender.value)
        tfOpacity.text = "\(value)%"
        opacityView()
    }
    
    @IBAction func delegateButtonAction(_ sender: UIButton) {
        let stor = UIStoryboard(name: "Main", bundle: nil)
        guard let FIrstViewController = stor.instantiateViewController(withIdentifier: "FIrstViewController") as? FIrstViewController else { return }
        FIrstViewController.color = colorView.backgroundColor
        FIrstViewController.transparency = colorView.alpha
        
        self.navigationController?.pushViewController(FIrstViewController, animated: true)
    }
    
    @IBAction func closureButtonAction(_ sender: UIButton) {
        let stor = UIStoryboard(name: "Main", bundle: nil)
        guard let FIrstViewController = stor.instantiateViewController(withIdentifier: "FIrstViewController") as? FIrstViewController else { return }
        FIrstViewController.color = colorView.backgroundColor
        FIrstViewController.transparency = colorView.alpha
        
        FIrstViewController.handler = { [unowned self]  in
            self.colorView.backgroundColor = FIrstViewController.ColorView.backgroundColor
            self.colorView.alpha = FIrstViewController.changedBackground.alpha
        }
    }
    
    private func colorVIew() {
        self.colorView.backgroundColor = UIColor(red: CGFloat(hsRed.value)/255, green: CGFloat(hsGreen.value)/255, blue: CGFloat(hsBlue.value)/255, alpha: 1)
    }
    
    private func setupUI() {
        hsRed.minimumValue = 0
        hsRed.maximumValue = 250
        
        hsGreen.minimumValue = 0
        hsGreen.maximumValue = 250
        
        hsBlue.minimumValue = 0
        hsBlue.maximumValue = 250
        
        
        hsOpacity.minimumValue = 0
        hsOpacity.maximumValue = 100
        
        colorView.layer.cornerRadius = 12
        
        hsRed.tintColor = UIColor.red
        hsGreen.tintColor = UIColor.green
        hsBlue.tintColor = UIColor.blue
    }
    
    private func opacityView() {
        let sliderValue = hsOpacity.value
        let alpha: CGFloat = CGFloat(sliderValue) / CGFloat(100)
        colorView.alpha = alpha
    }
    
    private func rgbToHex(red: Int, green: Int, blue: Int) -> String {
        let redHex = String(format: "%02X", red)
        let greenHex = String(format: "%02X", green)
        let blueHex = String(format: "%02X", blue)
        
        return "#" + redHex + greenHex + blueHex
    }
    
    func updateTextField(sender: UISlider, textField: UITextField){
        let value = Int(sender.value)
        textField.text = "\(value)"
    }
}



