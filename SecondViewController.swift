//
//  SecondViewController.swift
//  GetAuthorities
//
//  Created by 김재훈 on 2023/08/31.
//

import UIKit
import AVFoundation
import Speech

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        AVAudioSession.sharedInstance().requestRecordPermission { granted in
            
            switch granted {
            case true:
                print("Mic: 권한 허용")
            case false:
                print("Mic: 권한 거부")
            }
        }
        
        SFSpeechRecognizer.requestAuthorization { status in
            
            switch status {
            case .notDetermined:
                print("음성인식: 미결정")
            case .restricted:
                print("음성인식: 제한됨")
            case .denied:
                print("음성인식: 거부됨")
            case .authorized:
                print("음성인식: 승인됨")
            @unknown default:
                print("음성인식: 모르겠음")
            }
        }
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        print("마이크 접근상태 확인: ", terminator: "")
        
        switch AVAudioSession.sharedInstance().recordPermission {
        case .denied:
            print("거부됨")
        case .granted:
            print("허용됨")
        case .undetermined:
            print("미결정")
        @unknown default:
            print("모르겠음")
        }

        
    }
    
    @IBAction func btn2(_ sender: UIButton) {
        print("음성인식 접근상태 확인: ", terminator: "")
        
        switch SFSpeechRecognizer.authorizationStatus() {
        case .notDetermined:
            print("미결정")
        case .restricted:
            print("제한됨")
        case .denied:
            print("거부됨")
        case .authorized:
            print("승인됨")
        @unknown default:
            print("Fatal Error")
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
