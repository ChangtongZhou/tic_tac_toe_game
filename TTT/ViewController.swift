//
//  ViewController.swift
//  TTT
//
//  Created by Changtong Zhou on 7/8/16.
//  Copyright © 2016 Changtong Zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    
    @IBOutlet weak var winLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winLabel.hidden = true
        for i in 1...9{
            if let theButton = self.view.viewWithTag(i) as? UIButton{
                theButton.backgroundColor = UIColor.grayColor()
            }
        }
        
    }

    
    var player_one = true
    var counter = 0
    var click_one = [Int]()
    var click_two = [Int]()
    
    @IBAction func ticTacButtonPressed(sender: UIButton) {
        if counter <= 9{
            for i in 1...9{
                if sender.tag == i{
                    if let theButton = self.view.viewWithTag(i) as? UIButton{
                        
                        if player_one == true{
                            if theButton.backgroundColor == UIColor.grayColor(){
                                theButton.backgroundColor = UIColor.redColor()
                                player_one = false
                                counter += 1
                                click_one.append(sender.tag)
                            }
                            
                            
                        }
                        else{
                            if theButton.backgroundColor == UIColor.grayColor(){
                                theButton.backgroundColor = UIColor.blueColor()
                                player_one = true
                                counter += 1
                                click_two.append(sender.tag)
                            }
                            
                        }
                      check()
                    }
                    
                }
                
            }
        }
        
    }
    
    func check(){
        if (click_one.contains(1) && click_one.contains(2) && click_one.contains(3)) || (click_one.contains(4) && click_one.contains(5) && click_one.contains(6)) || (click_one.contains(7) && click_two.contains(8) && click_one.contains(9)) || (click_one.contains(1) && click_one.contains(5) && click_one.contains(9)) || (click_one.contains(3) && click_one.contains(5) && click_one.contains(7)) || (click_one.contains(1) && click_one.contains(4) && click_one.contains(7)) || (click_one.contains(2) && click_one.contains(5) && click_one.contains(8)) || (click_one.contains(3) && click_one.contains(6) && click_one.contains(9)){
            
            winLabel.text = "Red has won!"
            winLabel.hidden = false
            
            counter = 100
            
        }else if (click_two.contains(1) && click_two.contains(2) && click_two.contains(3)) || (click_two.contains(4) && click_two.contains(5) && click_two.contains(6)) || (click_two.contains(7) && click_two.contains(8) && click_two.contains(9)) || (click_two.contains(1) && click_two.contains(5) && click_two.contains(9)) || (click_two.contains(3) && click_two.contains(5) && click_two.contains(7)) || (click_two.contains(1) && click_two.contains(4) && click_two.contains(7)) || (click_two.contains(2) && click_two.contains(5) && click_two.contains(8)) || (click_two.contains(3) && click_two.contains(6) && click_two.contains(9)){
            winLabel.text = "Blue has won!"
            winLabel.hidden = false
            counter = 100
        }
    }
    
    @IBAction func resetButtonPressed(sender: UIButton) {
        click_one.removeAll()
        click_two.removeAll()
        for i in 1...9{
            if let theButton = self.view.viewWithTag(i) as? UIButton{
                theButton.backgroundColor = UIColor.grayColor()
            }
        }
        winLabel.hidden = true
        counter = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

