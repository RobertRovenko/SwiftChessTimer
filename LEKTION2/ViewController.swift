//
//  ViewController.swift
//  LEKTION2
//
//  Created by Robert Falkbäck on 2023-08-30.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var player1Timer: UILabel!
    
    @IBOutlet weak var player2Timer: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    var isPlayer1Turn = true
    
    var playIsPressed = false
      
    var isPlaying = false

    var gameTimer1: Timer?
    var gameTimer2: Timer?
   
    
    var playerOneTimeLeft: TimeInterval = 300.0
    var playerTwoTimeLeft: TimeInterval = 300.0
    
    let timeFormatter = DateComponentsFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        timeFormatter.unitsStyle = .positional
            timeFormatter.allowedUnits = [.minute, .second]
            timeFormatter.zeroFormattingBehavior = .pad
        
        
      
        player1Timer.text = timeFormatter.string(from: playerOneTimeLeft) ?? "0:00"
           player2Timer.text = timeFormatter.string(from: playerTwoTimeLeft) ?? "0:00"

       
       
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        
        playButton.setTitle("Play", for: .normal)
      
        gameTimer1?.invalidate()
        gameTimer2?.invalidate()
        resetTimer()
        isPlaying = false
       
        
    }
    
    func resetTimer(){
        
        playerOneTimeLeft = 300.0
        playerTwoTimeLeft = 300.0
        player1Timer.text = timeFormatter.string(from: playerOneTimeLeft) ?? "0:00"
        player2Timer.text = timeFormatter.string(from: playerTwoTimeLeft) ?? "0:00"
        
        print("timeresetter")
    }
    
   

    @IBAction func playButton(_ sender: UIButton) {
        
        if isPlaying {
               playButton.setTitle("Switch", for: .normal)
                print("player1")
               isPlaying = false
            gameTimer1?.invalidate()
            gameTimer2?.invalidate()
            isPlayer1Turn = false
         
            gameTimer1 =  Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                self.onTimerTick()
               
                
            }
            
           } else {
               playButton.setTitle("Play", for: .normal)
               isPlaying = true
               
               gameTimer2?.invalidate()
               gameTimer1?.invalidate()
               
               gameTimer2 =  Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                   self.onTimerTick()
               }
              
               isPlayer1Turn = true
               print("player2")
               
           }
        
      
        playIsPressed = true
        playButton.setTitle("Switch", for: .normal)
        
    }
  
    func onTimerTick() {
        
            if isPlayer1Turn == true {
                
                print("player1Tick")
                playerOneTimeLeft -= 1
                
            }else{
                
                print("player2Tick")
                playerTwoTimeLeft -= 1
            
        }
        
    
        player1Timer.text = timeFormatter.string(from: playerOneTimeLeft) ?? "0:00"
        player2Timer.text = timeFormatter.string(from: playerTwoTimeLeft) ?? "0:00"
    }

 
   
}

