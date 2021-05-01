
import UIKit

var disabled : Bool = false

class ViewController: UIViewController {
    

    @IBOutlet weak var numPlayerStart: UITextField!
    
    var history = false
    
    var array: [PersonView] = []
    var totalPlayer: Int = 8

    
    var count: Int = 1
    var life = 20
    
    
    @IBOutlet weak var contentView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var personPanel: PersonView
        
        for i in 1...totalPlayer{
            personPanel =  PersonView()
            personPanel.data = ("P \(count)",5, life)
            contentView.addArrangedSubview(personPanel)
            count = count + 1
            array.append(personPanel)
        }
        
        for i in 4...7{
            array[i].isHidden = true
        }
        
    }

    @IBAction func addPerson(_ sender: Any) {

        let num = Int(numPlayerStart.text!)!
        
        if (num < 9 && num > 1 && disabled == false) {
            for i in 0...num - 1{
                array[i].isHidden = false
                
            }
            if(num != 8){
                for i in num...7{
                    array[i].isHidden = true
                }
            }
        } else {
            numPlayerStart.isHidden = true
        }
    
    }

}

class PersonView: UIView {

    var data : (String, Int, Int) = ("", 5, 20) {
        didSet {
            // Update the label with modified data
            label.text = "\(data.0) : \(data.1) : \(data.2)"
        }
    }
    
    weak var label : UILabel!
    weak var numberInput : UITextField!
    weak var submit : UIButton!
    weak var counterLabel : UILabel!
    weak var minus5button : UIButton!
    weak var minus1button: UIButton!
    weak var plus1button: UIButton!
    weak var plus5button: UIButton!
    weak var loser : UILabel!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initSubViews()
    }
    
    private func initSubViews() {
        // Instantiate the nib into existence
        let nib = UINib(nibName: "PersonPanel", bundle: nil)
        let nibInstance = nib.instantiate(withOwner: self, options: nil)
        
        // Get the view from the instantiated nib and add it into our own tree
        let nibView = (nibInstance.first) as! UIView
        addSubview(nibView)
        
    
        //print("Do I get here")
        loser = (nibView.subviews[0].subviews[0] as! UILabel)
 
        label = (nibView.subviews[1].subviews[0] as! UILabel)
        label.text = "\(data.0)"

        numberInput = (nibView.subviews[1].subviews[1] as! UITextField)

        submit = (nibView.subviews[1].subviews[2] as! UIButton)
        submit.addTarget(self, action: #selector(submit(_:)), for: .touchUpInside)

        counterLabel = (nibView.subviews[1].subviews[3] as! UILabel)
        counterLabel.text = "\(data.2)" 
        
        
        minus5button = (nibView.subviews[2].subviews[0] as! UIButton)
        minus5button.addTarget(self, action: #selector(minus5(_:)), for: .touchUpInside)
        
        minus1button = (nibView.subviews[2].subviews[1] as! UIButton)
        minus1button.addTarget(self, action: #selector(minus1(_:)), for: .touchUpInside)

        plus1button = (nibView.subviews[2].subviews[2] as! UIButton)
        plus1button.addTarget(self, action: #selector(plus1(_:)), for: .touchUpInside)
        
        plus5button = (nibView.subviews[2].subviews[3] as! UIButton)
        plus5button.addTarget(self, action: #selector(plus5(_:)), for: .touchUpInside)
    
        
    }
    
    @objc private func minus5(_ sender : UIButton) {
        disabled = true
        data = (data.0,data.1,data.2 - data.1)
        label.text = "\(data.0) : \(data.1) : \(data.2)"
//        hist.append("5 subtracterd from \(data.0)")
        if(data.2 <= 0){
            loser.text = "The loser is \(data.0)"
        }
    }
    
    @objc private func minus1(_ sender : UIButton) {
        disabled = true
        data = (data.0,data.1,data.2 - 1)
        label.text = "\(data.0) : \(data.1) : \(data.2)"
        if(data.2 <= 0){
            loser.text = "The loser is \(data.0)"
        }

    }
    
    @objc private func plus1(_ sender : UIButton) {
        disabled = true
        data = (data.0,data.1,data.2 + 1)
        label.text = "\(data.0) : \(data.1) : \(data.2)"
        if(data.2 <= 0){
            loser.text = "The loser is \(data.0)"
        }

    }
    
    @objc private func plus5(_ sender : UIButton) {
        disabled = true
        data = (data.0,data.1,data.2 + data.1)
        label.text = "\(data.0) : \(data.1) : \(data.2)"
        if(data.2 <= 0){
            loser.text = "The loser is \(data.0)"
        }
    }
    
    @objc private func submit(_ sender : UIButton) {
        data.1 = Int(numberInput.text!)!
        let minusString = "- " + String(data.1)
        let plusString = "+ " + String(data.1)
        minus5button.setTitle(minusString, for: .normal)
        plus5button.setTitle(plusString, for: .normal)
        
    }
}


