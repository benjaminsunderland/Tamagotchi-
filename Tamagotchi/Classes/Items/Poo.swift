//
//  Poo.swift
//  Tamagotchi
//
//  Created by James Hughes on 13/11/2017.
//  Copyright © 2017 Tammo Team. All rights reserved.
//

import Foundation
import SpriteKit

class VisualPoo: SKSpriteNode {
    

    func initialize(name: String, position: CGPoint ){
        self.name = name
        self.size = CGSize(width:100.0, height: 100.0)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.position = position
        self.zPosition = 4;
        self.texture = SKTexture(imageNamed: "poop.png")
        
        self.physicsBody = SKPhysicsBody(texture: self.texture!, size: self.size);
        self.physicsBody?.affectedByGravity = true;
        self.physicsBody?.isDynamic = true;
        self.physicsBody?.restitution = 0
        self.physicsBody?.allowsRotation = false;
        
        self.physicsBody?.categoryBitMask = ColliderType.Poo;
        self.physicsBody?.collisionBitMask = ColliderType.Egg;
        self.physicsBody?.contactTestBitMask = ColliderType.Egg;
    }
    
}

