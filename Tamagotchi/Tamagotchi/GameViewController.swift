//
//  GameViewController.swift
//  Tamagotchi
//
//  Created by James Hughes on 07/11/2017.
//  Copyright © 2017 Tammo Team. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    @IBOutlet weak var creatureDisplay: UIImageView!
    @IBOutlet weak var manualEggCrack: UIButton!
    @IBOutlet weak var userInputField: UITextField!
    @IBOutlet weak var userOutputField: UITextView!
    @IBOutlet weak var temperatureDisplay: UITextView!
    @IBOutlet weak var ageDisplay: UITextView!
    @IBOutlet weak var sizeDisplay: UITextView!
    @IBOutlet weak var crackedDisplay: UITextView!
    
    var egg = Egg()
    
    
    @IBAction func increaseAge(_ sender: Any) {
        egg.grow()
        updateBasicStats()
    }
    
    @IBAction func manualEggCrackAction(_ sender: Any) {
        if creatureDisplay.image == UIImage(named: "eggcrack") {
            creatureDisplay.image = UIImage(named: "photoegg3")
            egg.healEggManual();
            manualEggCrack.setTitle("Crack Da Egg", for: .normal)
        }
        else {
            creatureDisplay.image = UIImage(named: "eggcrack")
            egg.crackEggManual();
            manualEggCrack.setTitle("Heal Da Egg", for: .normal)
        }
    }
    
    @IBAction func textInputted(_ sender: Any) {
        let helpedEgg = egg.helpEgg(item: userInputField.text!)
        userOutputField.text = "\(helpedEgg) and \(egg.die(temp: egg.temp, age: egg.age))"
        updateBasicStats()
    }
    
    func updateBasicStats(){
        temperatureDisplay.text = "\(egg.temp)"
        ageDisplay.text = "\(egg.age)"
        sizeDisplay.text = "\(egg.size)"
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        userInputField.resignFirstResponder()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userInputField.delegate = self;
        updateBasicStats()
        creatureDisplay.image = UIImage(named: "photoegg3")
        manualEggCrack.setTitle("What happens when you press this?", for: .normal)
        
//        if let view = self.view as! SKView? {
//            // Load the SKScene from 'GameScene.sks'
//            if let scene = SKScene(fileNamed: "GameScene") {
//            // Set the scale mode to scale to fit the window
//                scene.scaleMode = .aspectFill
//            // Present the scene
//                view.presentScene(scene)
//            }
//
//            view.ignoresSiblingOrder = true
//            view.showsFPS = true
//            view.showsNodeCount = true
//        }
        
    }
    

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return .allButUpsideDown
            } else {
                return .all
            }
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension GameViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true
    }
}
