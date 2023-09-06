import UIKit

class SecondViewController: UIViewController {

    // MARK: - IBOutlet RED
    @IBOutlet private weak var hsRed: UISlider!
    @IBOutlet private weak var tfRed: UITextField!
    
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
    @IBOutlet private weak var doneBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    var text: String?
    var delegate: DataUpdateProtocol?
    
    
    @IBAction func hsRedAction(_ sender: UISlider) {
        let value = Int(sender.value)
        tfRed.text = "\(value)"
        colorVIew()
        
    }
    
    @IBAction func tfRedAction(_ sender: UITextField) {
        
    }
    
    @IBAction func hsGreenAction(_ sender: UISlider) {
        let value = Int(sender.value)
        tfGreen.text = "\(value)"
        colorVIew()
    }
    
    @IBAction func tfGreenAction(_ sender: UITextField) {
        
    }
    
    @IBAction func hsBlueAction(_ sender: UISlider) {
        let value = Int(sender.value)
        tfBlue.text = "\(value)"
        colorVIew()
    }
    
    
    @IBAction func tfBlueAction(_ sender: UITextField) {
        
    }
    
    
    @IBAction func colorTFAction(_ sender: UITextField) {
        
    }
    
    
    @IBAction func opacityHSAction(_ sender: UISlider) {
        let value = Int(sender.value)
        tfOpacity.text = "\(value)%"
    }
    @IBAction func tfActionOpacity(_ sender: UITextField) {
        
    }
    
    @IBAction func doneButtonAction(_ sender: UIButton) {
        
    }
    
    func colorVIew() {
        self.colorView.backgroundColor = UIColor(red: CGFloat(hsRed.value)/255, green: CGFloat(hsGreen.value)/255, blue: CGFloat(hsBlue.value)/255, alpha: 1)
    }

    func setupUI() {
        hsRed.minimumValue = 0
        hsRed.maximumValue = 250
        
        hsGreen.minimumValue = 0
        hsGreen.maximumValue = 250
        
        hsBlue.minimumValue = 0
        hsBlue.maximumValue = 250
        
        hsOpacity.minimumValue = 0
        hsOpacity.maximumValue = 100
        
        colorView.layer.cornerRadius = 12
    }
    
   
    
    
}


//@objc func sliderValueDidChange(sender: UISlider) {
//    let sliderPercentage = sender.value / sender.maximumValue
//    let invertedPercentage = 1 - sliderPercentage
//    let hue = CGFloat(invertedPercentage * 120 / 360)
//
//    let trackColor = UIColor(hue: hue, saturation: 0.95, brightness: 0.87, alpha: 1)
//    brokeSlider.minimumTrackTintColor = trackColor

//self.colorView.backgroundColor = UIColor(red: CGFloat(hsRed.value)/255, green: CGFloat(hsGreen.value)/255, blue: CGFloat(hsBlue.value)/255, alpha: 1)
