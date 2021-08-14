//
//  ViewController.swift
//  tabark
//
//  Created by diaa on 13/08/2021.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    @IBOutlet weak var iamgeContainer: UIImageView!
    @IBOutlet weak var buttonContainer: UIButton!
    
    var audioPlayer : AVAudioPlayer!
    var imag : UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        iamgeContainer.image = imag
    }
    let buttonSound = UIButton(frame: CGRect(x: 0, y: 0, width: 110 , height: 100))
    
    let buttonDec = UIButton(frame: CGRect(x: UIScreen.main.bounds.maxX - 110 , y: 0, width: 110 , height: 100))
    var buttonwhytag = 5
    var buttontag = 5
    @IBAction func buttonContainerAction(_ sender: Any) {
        
        //MARK:- add button sound
        buttonSound.isHidden = false
        buttonSound.setTitle("Aqraaly", for: .normal)
        buttonSound.setImage(UIImage(systemName: "speaker.wave.3.fill"), for: .normal)
        buttonSound.addTarget(self, action: #selector(dosound), for: .touchUpInside)
        buttonSound.tintColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        buttonSound.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        view.addSubview(buttonSound)
        
        
        
        buttonDec.isHidden = false
        buttonDec.setTitle("Why", for: .normal)
        buttonDec.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        buttonDec.addTarget(self, action: #selector(whyt), for: .touchUpInside)
        buttonDec.tintColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        buttonDec.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        view.addSubview(buttonDec)
        
    }
    
    @objc func dosound(){
        //MARK:- SOUND TARGET
        if let soundURL = Bundle.main.url(forResource: "5", withExtension: "mp3")
        {
            if  buttontag == 5{
                buttontag = -1
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            }
            catch{
               print(error)
            }
            audioPlayer.play()
                buttonSound.setImage(UIImage(systemName: "speaker.slash.fill"), for: .normal)
            }
            
            else{
                buttontag = 5
                audioPlayer.stop()
                buttonSound.isHidden = true
            }
        }
        else{
            print("sound not founded")
        }
    }
    
    @objc func whyt(){
        if buttonwhytag == 5{
            buttonwhytag = -1
        iamgeContainer.image = UIImage(named: "4")
        }
        else{
            iamgeContainer.image = UIImage(named: "1")
            buttonDec.isHidden = true
        }
    }
}

