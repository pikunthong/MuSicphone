//
//  ViewController.swift
//  ios 13610326 week8 project1 xylophone
//
//  Created by ICT-MAC on 28/9/2562 BE.
//  Copyright © 2562 ictsilpakorn. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    // ที่ไม่ได้อยู่ในฟังก์ชั่น หรือไม่ได้อยู่ใน ปีกกาใด เรียกว่า Global Scope
    //Scope พื้นที่ขอบเขต
    //Global
    
    //inheritance = สืบทอด
    //Delegate = ตัวแทน ตัวเชื่อมโยง รับส่ง
    var audioPlayer : AVAudioPlayer!
    var audioPlayer2 = AVAudioPlayer()
    //identifier
    //type ชนิด class คลาสหนึ่ง สูตรสำหรับ แผนผังแบบแปรนบ้าน
    @IBOutlet var notesPiano: [UIButton]!
    
    let references = ["C3", "Cc", "D", "Dd", "E", "F", "Ff", "G", "Gg", "A", "Aa", "B", "C4"]
    
    let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    var selectedSoundFileName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
    
    
    @IBAction func notePressed(_ sender: UIButton) {
        selectedSoundFileName = soundArray[sender.tag-1]
        print(selectedSoundFileName)
        playSound()
    }
    
    func playSound (){
        let soundURL = Bundle.main.url(forResource : selectedSoundFileName, withExtension: "wav")
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
            guard let audioPlayer = audioPlayer else {return}
            
            audioPlayer.prepareToPlay()
            //ถ้าไฟล์ใหญ่ จะโหลดมารอ
            audioPlayer.play()
            
            
            
        }catch let error as Error{
            print(error)
        }
    }
    
//    ...... piano .......
    @IBAction func notesPianoPressd(_ sender: UIButton) {
        play(notesPiano: notesPiano.index(of: sender)! + 1 )
    }
    
    func play(notesPiano: Int) {
        print(notesPiano,references[notesPiano - 1])
        let reference = references[notesPiano - 1]
        if let path = Bundle.main.path(forResource: reference, ofType: "wav") {
            let url = URL(fileURLWithPath: path)
            print(reference)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer.prepareToPlay()
                audioPlayer.play()
                
            }
            catch {
                print(error)
            }
        }
    }
    
//    ...... piano .......
}//end class

