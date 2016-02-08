//
//  ViewController.swift
//  SceneKit Additions
//
//  Created by Davis Allie on 8/02/2016.
//  Copyright © 2016 tutsplus. All rights reserved.
//

import UIKit
import SceneKit
import SpriteKit

class ViewController: UIViewController {
    
    var sceneView: SCNView?
    var mainScene = SCNScene(named: "MainScene.scn")

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.sceneView = SCNView(frame: self.view.frame)
        self.sceneView?.scene = mainScene
        
        self.view.addSubview(self.sceneView!)
        
        let button = UIButton(type: .System)
        button.tintColor = UIColor.blueColor()
        button.setTitle("Transition", forState: .Normal)
        button.sizeToFit()
        button.addTarget(self, action: "didPressTransition", forControlEvents: .TouchUpInside)
        button.center.x = self.view.center.x
        button.frame.origin.y = self.view.frame.height - button.frame.height - 12
        self.sceneView?.addSubview(button)
        
        // MARK: Example Audio Node
        let audioNode = SCNNode()
        let audioSource = SCNAudioSource(fileNamed: "AnAudioFile.mp3")!
        let audioPlayer = SCNAudioPlayer(source: audioSource)

        audioNode.addAudioPlayer(audioPlayer)

        let play = SCNAction.playAudioSource(audioSource, waitForCompletion: true)
        audioNode.runAction(play)
    }
    
    func didPressTransition() {
        let transition = SKTransition.pushWithDirection(.Right, duration: 1.0)
        self.sceneView?.presentScene(SCNScene(), withTransition: transition, incomingPointOfView: nil, completionHandler: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}