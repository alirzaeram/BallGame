//
//  GameScene.swift
//  BallGame
//
//  Created by Eram on 11/27/21.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let manager = CMMotionManager()
    var player = SKSpriteNode()
    
    private var positions: [CGPoint] = []
    
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        player = self.childNode(withName: "player") as! SKSpriteNode
        
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.1
        manager.startAccelerometerUpdates(to: .main) {
            (data, error) in
            guard let data = data else { return }
            self.physicsWorld.gravity = CGVector(dx: CGFloat(data.acceleration.x) * 20,
                                                 dy: CGFloat(data.acceleration.y) * 20)
        }
        
    }
    
}
