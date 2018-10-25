//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
//that is for audio visual foundation
class ViewController: UIViewController{
    var audioPlayer : AVAudioPlayer!
    let soundArray  = ["note1","note2", "note3", "note4", "note5", "note6", "note7"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    //all keys have been linked together to answer to this one button
    //each key given a unique tag
    //tags can help us identify which button was pressed
    @IBAction func notePressed(_ sender: UIButton) {
        //print which button was pressed
        var selectSoundFileName : String = soundArray[sender.tag - 1]
        playSoundW(fileName: selectSoundFileName, fileEx: "wav")
    }
    
    func playSoundW (fileName : String, fileEx : String) -> Void
    {
        //gather the audio file source location
        let audioSourceUrl : URL!
        audioSourceUrl = Bundle.main.url(forResource: fileName, withExtension: fileEx)
        //now check if file contanis an address or nil value
        if audioSourceUrl == nil
        {
            print("can not play song")
        }
        else
        {
            //prepare the audio to play the track
            do
            {
                audioPlayer = try AVAudioPlayer.init(contentsOf: audioSourceUrl)
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            }catch
            {
                print(error)
            }
        }
    }
}

