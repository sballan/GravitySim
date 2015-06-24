//
//  Body.swift
//  Gravity
//
//  Created by Samuel Ballan on 5/20/15.
//  Copyright (c) 2015 Samuel Ballan. All rights reserved.
//

import Foundation
import SpriteKit

class Body: SKSpriteNode {
	var massMultiplier: CGFloat?
	var gravityStrength: Float?
	
	var shape: SKShapeNode?
	var gravityField: SKFieldNode!
	var areaForMassMultiplier: CGFloat = 0.05
	
	
	var area: CGFloat {
		get{return (10 + self.frame.width) * (10 + self.frame.height) }
	}
	
	var bodyColor: SKColor! {
		get{ return self.shape!.fillColor }
		set(newColor){ self.shape?.fillColor = newColor }
	}
	
	var bodyName: String? {
		get{return self.name}
		set(newName) {
			self.shape?.name = newName
			self.gravityField.name = newName
			self.name = newName
		}
	}
	
	
	func explode() {
		let sparks = SKEmitterNode(fileNamed: "ExplosionParticles")
		sparks.numParticlesToEmit = 100
		
		self.parent!.addChild(sparks)
		sparks.position.x = convertPoint(sparks.position, fromNode: self.parent!).x * -1
		sparks.position.y = convertPoint(sparks.position, fromNode: self.parent!).y * -1
		// TODO: - Make Body keep track of it's momentum, and apply this momentum to the sparks it makes
		
		// TODO: - Have the Bodies Shatter into smaller bodies which each then have their own momentums and stuff
	}
	
	func setup(color: SKColor, _ size: CGSize) {
		setShape(color: color, size: size)
		setPhysics()
	}
	
	func setShape(#color: SKColor, size: CGSize) {
		shape = SKShapeNode(circleOfRadius: size.width / 2)
		shape?.fillColor = color
		shape?.strokeColor = SKColor.clearColor()
		addChild(shape!)
	}
	
	func setPhysics() {
		self.physicsBody = SKPhysicsBody(circleOfRadius: shape!.frame.width / 2)
		self.physicsBody?.dynamic = true
		self.physicsBody?.mass = area * areaForMassMultiplier
		self.physicsBody?.allowsRotation = false
		self.physicsBody?.restitution = 0.4
		self.physicsBody?.affectedByGravity = false
		
		gravityField = SKFieldNode.radialGravityField()
		gravityField.enabled = true
		gravityField.strength = 4
		gravityField.smoothness = 0.6
		gravityField.falloff = 0
		gravityField.minimumRadius = 2
		self.addChild(gravityField)

	}
	
	func update() {
//		println("\(self.name)")
//		println("    position: \(self.position)")
//		println("    mass: \(self.physicsBody?.mass)")
//		println("    field: \(self.gravityField.position)")
		
	}
	

	override init(texture: SKTexture!, color: SKColor!, size: CGSize) {
	super.init(texture: nil, color: nil, size: size)
	setup(color, size)
	
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}