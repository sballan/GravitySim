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
	
	func update() {
		for child in children {
			child.update()
		}
	}
	
	func createContent() {
		planet = Body(texture: nil, color: SKColor.blueColor(), size: CGSize(width: 30, height: 30))
		planet.name = "planet"
		
		planet.physicsBody?.fieldBitMask = PhysicalConstants.planetCategory
		planet.gravityField.categoryBitMask = PhysicalConstants.moonCategory
		planet.physicsBody?.mass *= 60
		
		moon = Body(texture: nil, color: SKColor.whiteColor(), size: CGSize(width: 10, height: 10))
		moon.position = CGPoint(x: 300, y: 100)
		moon.name = "moon"
		
		moon.physicsBody?.fieldBitMask = PhysicalConstants.moonCategory
		moon.gravityField.categoryBitMask = PhysicalConstants.planetCategory
		moon.gravityField.enabled = true
		
		
		

	}
	
	override init() {
		super.init()
		createContent()
		addChild(planet)
		addChild(moon)
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

struct PhysicalConstants {
	static let planetCategory: UInt32 = 1
	static let moonCategory: UInt32 = 2
}
