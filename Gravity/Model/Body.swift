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
	var shape: SKShapeNode!
	var gravityField: SKFieldNode!
	
	var area: CGFloat {
		get{return self.frame.width * self.frame.height}
	}
	
	func setup(color: SKColor, _ size: CGSize) {
		setShape(color: color, size: size)
		setPhysics()
	}
	
	func setShape(#color: SKColor, size: CGSize) {
		shape = SKShapeNode(circleOfRadius: size.width / 2)
		shape.fillColor = color
		shape.strokeColor = SKColor.clearColor()
		addChild(shape)
	}
	
	func setPhysics() {
		self.physicsBody = SKPhysicsBody(circleOfRadius: shape.frame.width / 2)
		self.physicsBody?.dynamic = true
		self.physicsBody?.mass = area / 50
		self.physicsBody?.allowsRotation = true
		self.physicsBody?.restitution = 0.9
		self.physicsBody?.affectedByGravity = false
		self.physicsBody?.fieldBitMask = PhysicalConstants.moonCategory
		
		gravityField = SKFieldNode.radialGravityField()
		gravityField.enabled = true
		gravityField.strength = 3
		gravityField.smoothness = 1
		gravityField.falloff = 1
		gravityField.minimumRadius = 1
		self.addChild(gravityField)

		
		var s = CFAbsoluteTimeGetCurrent()
	}
	
	func update() {
		println("\(self.name)")
		println("    position: \(self.position)")
		println("    mass: \(self.physicsBody?.mass)")
		println("    field: \(self.gravityField.position)")
		
		if self.name == "moon" {
			gravityField.strength = 1
			gravityField.minimumRadius = 1
		}
	}
	

	override init(texture: SKTexture!, color: SKColor!, size: CGSize) {
	super.init(texture: nil, color: nil, size: size)
	setup(color, size)
	
	}
	

	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}