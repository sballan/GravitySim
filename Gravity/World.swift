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
	
	var planet: Body!
	var moon: Body!
	var moon2: Body!
	var gravityWell: SKFieldNode?
	
	func update() {
		for child in children {
			//child.update()
		}
	}
	
	func createContent() {
		planet = Body(texture: nil, color: SKColor.blueColor(), size: CGSize(width: 40, height: 40))
		planet.name = "planet"
		
		planet.physicsBody?.fieldBitMask = PhysicalConstants.planetCategory
		planet.gravityField.categoryBitMask = PhysicalConstants.moonCategory | PhysicalConstants.moon2Category
		planet.physicsBody?.mass *= 1000000
		
		moon = Body(texture: nil, color: SKColor.whiteColor(), size: CGSize(width: 10, height: 10))
		moon.position = CGPoint(x: 300, y: 100)
		moon.name = "moon"
		
		moon.physicsBody?.fieldBitMask = PhysicalConstants.moonCategory
		moon.gravityField.categoryBitMask = PhysicalConstants.planetCategory | PhysicalConstants.moon2Category
		moon.gravityField.enabled = true
		moon.gravityField.strength = 1
		moon.physicsBody?.mass = 0.01
		
		gravityWell = SKFieldNode.radialGravityField()
		gravityWell!.enabled = true
		gravityWell!.strength = 30
		gravityWell!.falloff = 0
		gravityWell?.categoryBitMask = PhysicalConstants.planetCategory
		
		
		moon2 = Body(texture: nil, color: SKColor.whiteColor(), size: CGSize(width: 5, height: 5))
		moon2.position = CGPoint(x: 310, y: 110)
		moon2.name = "moon"
		
		moon2.physicsBody?.fieldBitMask = PhysicalConstants.moon2Category
		moon2.gravityField.categoryBitMask = PhysicalConstants.moonCategory
		moon2.gravityField.enabled = true
		moon2.gravityField.strength = 0.0002
		moon2.physicsBody?.mass = 0.00004
		
		
		

	}
	
	override init() {
		super.init()
		createContent()
		addChild(planet)
		addChild(moon)
		addChild(moon2)
		addChild(gravityWell!)
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

struct PhysicalConstants {
	static let planetCategory: UInt32 = 2
	static let moonCategory: UInt32 = 4
	static let moon2Category: UInt32 = 8
}
