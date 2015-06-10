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
	var shape: SKShapeNode?
	var gravityField: SKFieldNode!
	
	var area: CGFloat {
		get{return (10 + self.frame.width) * (10 + self.frame.height) }
	}
	
	var bodyColor: SKColor! {
		get{
			return self.shape!.fillColor
		}
		set(newColor){
			self.shape?.fillColor = newColor
		}
	}
	
	var bodyName: String? {
		set(newName) {
			self.shape?.name = newName
			self.gravityField.name = newName
			self.name = newName
		}
		get{return self.name}
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
		self.physicsBody?.mass = area / 50
		self.physicsBody?.allowsRotation = true
		self.physicsBody?.restitution = 0.8
		self.physicsBody?.affectedByGravity = false
		
		gravityField = SKFieldNode.radialGravityField()
		gravityField.enabled = true
		gravityField.strength = 4
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
		
	}
	

	override init(texture: SKTexture!, color: SKColor!, size: CGSize) {
	super.init(texture: nil, color: nil, size: size)
	setup(color, size)
	
	}
	

	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}