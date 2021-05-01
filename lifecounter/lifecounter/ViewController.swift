//
//  ViewController.swift
//  lifecounter
//
//  Created by Saurav Sawansukha on 4/21/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lifePlayer1: UILabel!
    @IBOutlet weak var lifePlayer2: UILabel!
    @IBOutlet weak var lifePlayer3: UILabel!
    @IBOutlet weak var lifePlayer4: UILabel!
    @IBOutlet weak var loser: UILabel!
    
    var clicked: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func addPlayer(_ sender: Any) {
        
    }
    
    func changeValue(_ val: Int,_ target: Int) {
    switch target {
        case 1:
            let lifeTotal = Int(lifePlayer1.text!)!
            let newTotal = lifeTotal + val
            lifePlayer1.text = String(newTotal)
                if (newTotal <= 0) {
                    loser.text = "Player 1 LOSES!"
                }
        
        
        case 2:
            let lifeTotal = Int(lifePlayer2.text!)!
            let newTotal = lifeTotal + val
            lifePlayer2.text = String(newTotal)
                if (newTotal <= 0) {
                    loser.text = "Player 2 LOSES!"
                }
        
        
        case 3:
            let lifeTotal = Int(lifePlayer3.text!)!
            let newTotal = lifeTotal + val
            lifePlayer3.text = String(newTotal)
                if (newTotal <= 0) {
                    loser.text = "Player 3 LOSES!"
                }
        
        
        case 4:
            let lifeTotal = Int(lifePlayer4.text!)!
            let newTotal = lifeTotal + val
            lifePlayer4.text = String(newTotal)
                if (newTotal <= 0) {
                    loser.text = "Player 4 LOSES!"
                }
        
        default:
            print("Shouldn't be able to get here")
        
        }
    }

    @IBAction func neg5Player1(_ sender: Any) {
        changeValue(-5, 1)
    }
    @IBAction func neg1Player1(_ sender: Any) {
        changeValue(-1, 1)
    }
    @IBAction func pos1Player1(_ sender: Any) {
        changeValue(1, 1)
    }
    @IBAction func pos5Player1(_ sender: Any) {
        changeValue(5, 1)
    }
    
    @IBAction func neg5Player2(_ sender: Any) {
        changeValue(-5, 2)
    }
    
    @IBAction func neg1Player2(_ sender: Any) {
        changeValue(-1, 2)
    }
    
    @IBAction func pos1Player2(_ sender: Any) {
        changeValue(1, 2)
    }
    
    @IBAction func pos5Player2(_ sender: Any) {
        changeValue(5, 2)
    }
    
    @IBAction func neg5Player3(_ sender: Any) {
        changeValue(-5, 3)
    }
    
    @IBAction func neg1Player3(_ sender: Any) {
        changeValue(-1, 3)
    }
    
    @IBAction func pos1Player3(_ sender: Any) {
        changeValue(1, 3)
    }
    
    @IBAction func pos5Player3(_ sender: Any) {
        changeValue(5, 3)
    }
    
    
    @IBAction func neg5Player4(_ sender: Any) {
        changeValue(-5, 4)

    }
    
    
    @IBAction func neg1Player4(_ sender: Any) {
        changeValue(-1, 4)
    }
    
    
    @IBAction func pos1Player4(_ sender: Any) {
        changeValue(1, 4)
    }
    
    
    @IBAction func pos5Player4(_ sender: Any) {
        changeValue(5, 4)
    }
}

