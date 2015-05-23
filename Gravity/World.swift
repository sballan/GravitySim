//
//  World.swift
//  Gravity
//
//  Created by Samuel Ballan on 5/20/15.
//  Copyright (c) 2015 Samuel Ballan. All rights reserved.
//

import Foundation
import SpriteKit

class World: SKNode {
	
	var sun: Body!
	var planet: Body!
	var moon: Body!
	var gravityWell: SKFieldNode?
	
	func update() {
		for child in children {
			//child.update()
		}
	}
	
	func createContent() {
		sun = Body(texture: nil, color: SKColor.yellowColor(), size: CGSize(width: 20, height: 20))
		sun.name = "sun"
		
		sun.physicsBody?.fieldBitMask = PhysicalConstants.sunCategory
		sun.gravityField.categoryBitMask = PhysicalConstants.planetCategory | PhysicalConstants.moonCategory
		sun.physicsBody?.mass *= 1000000
		
		planet = Body(texture: nil, color: SKColor.lightGrayColor(), size: CGSize(width: 10, height: 10))
		planet.position = CGPoint(x: 300, y: 100)
		planet.name = "planet"
		
		planet.physicsBody?.fieldBitMask = PhysicalConstants.planetCategory
		planet.gravityField.categoryBitMask = PhysicalConstants.sunCategory | PhysicalConstants.moonCategory
		planet.gravityField.enabled = true
		planet.gravityField.strength = 1
		planet.physicsBody?.mass = 0.01
		
		gravityWell = SKFieldNode.radialGravityField()
		gravityWell!.enabled = true
		gravityWell!.strength = 15
		gravityWell!.falloff = 0
		gravityWell?.categoryBitMask = PhysicalConstants.sunCategory
		
		
		moon = Body(texture: nil, color: SKColor.whiteColor(), size: CGSize(width: 5, height: 5))
		moon.position = CGPoint(x: 310, y: 110)
		moon.name = "moon"
		
		moon.physicsBody?.fieldBitMask = PhysicalConstants.moonCategory
		moon.gravityField.categoryBitMask = PhysicalConstants.planetCategory
		moon.gravityField.enabled = true
		moon.gravityField.strength = 0.0002
		moon.physicsBody?.mass = 0.00004
		
		
		

	}
	
	override init() {
		super.init()
		createContent()
		addChild(sun)
		addChild(planet)
		addChild(moon)
		addChild(gravityWell!)
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

struct PhysicalConstants {
	static let sunCategory: UInt32 = 2
	static let planetCategory: UInt32 = 4
	static let moonCategory: UInt32 = 8
}
