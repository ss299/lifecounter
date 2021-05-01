//
//  ViewController.swift
//  NibLoadingDemo
//
//  Goal: When the user pushes the "Add Person" button at the top of this
//  screen, a "name/age" (and "Happy Birthday!" button) should appear in
//  a vertically-growing list. The Person "panel" should be loaded from a
//  XIB file, and when the "Happy Birthday!" button is pressed, it should
//  increment the Person's age, and the hosting ViewController (this one)
//  should present an Alert controller that says "Happy Birthday!"
//
//  Created by Ted Neward on 4/27/21.
//

import UIKit

var hist : [String] = []




class ViewController: UIViewController {
    

    @IBOutlet weak var numPlayerStart: UITextField!
    var history = false
    @IBOutlet weak var loser: UILabel!
    
    
    var count: Int = 1
    var life = 20
    
    
    @IBOutlet weak var contentView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addPerson(_ sender: Any) {
        NSLog("Add Person")

        // Get a random name and age from out of nowhere
        

        /* Option 2: Create a custom UIView subclass to handle its own events */
        let num = Int(numPlayerStart.text!)!
        
        if (num < 8) {
            for i in 1...num{
                let personPanel = PersonPanelView()
                personPanel.data = ("Person \(count)",5, life)
                contentView.addArrangedSubview(personPanel)
                count = count + 1
            }
        }
        
        
    }

}

class PersonPanelView: UIView {

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
        
        // Wire up the controls to this view
        label = (nibView.subviews[0].subviews[0] as! UILabel)
        label.text = "\(data.0)"

        counterLabel = (nibView.subviews[0].subviews[3] as! UILabel)
        counterLabel.text = "\(data.2)" 
        
        //numberInput.add
        numberInput = (nibView.subviews[0].subviews[1] as! UITextField)
        
        submit = (nibView.subviews[0].subviews[2] as! UIButton)
        submit.addTarget(self, action: #selector(submit(_:)), for: .touchUpInside)
        
        minus5button = (nibView.subviews[1].subviews[0] as! UIButton)
        minus5button.addTarget(self, action: #selector(minus5(_:)), for: .touchUpInside)
        
        minus1button = (nibView.subviews[1].subviews[1] as! UIButton)
        minus1button.addTarget(self, action: #selector(minus1(_:)), for: .touchUpInside)

        plus1button = (nibView.subviews[1].subviews[2] as! UIButton)
        plus1button.addTarget(self, action: #selector(plus1(_:)), for: .touchUpInside)
        
        plus5button = (nibView.subviews[1].subviews[3] as! UIButton)
        plus5button.addTarget(self, action: #selector(plus5(_:)), for: .touchUpInside)
    }
    
    @objc private func submit(_ sender : UIButton) {
        data.1 = Int(numberInput.text!)!
        let minusString = "- " + String(data.1)
        let plusString = "+ " + String(data.1)
        minus5button.setTitle(minusString, for: .normal)
        plus5button.setTitle(plusString, for: .normal)
        
    }
    
    @objc private func minus5(_ sender : UIButton) {
        data = (data.0,data.1,data.2 - data.1)
        label.text = "\(data.0) : \(data.1) : \(data.2)"

        
//        hist.append("5 subtracterd from \(data.0)")
    }
    
    @objc private func minus1(_ sender : UIButton) {
        data = (data.0,data.1,data.2 - 1)
        label.text = "\(data.0) : \(data.1) : \(data.2)"

//        hist.append("1 subtracted from \(data.0)")
    }
    
    @objc private func plus1(_ sender : UIButton) {
        data = (data.0,data.1,data.2 + 1)
        label.text = "\(data.0) : \(data.1) : \(data.2)"

//        hist.append("1 added from \(data.0)")
    }
    
    @objc private func plus5(_ sender : UIButton) {
        data = (data.0,data.1,data.2 + data.1)
        label.text = "\(data.0) : \(data.1) : \(data.2)"
//        hist.append("5 addded from \(data.0)")
    }

}


