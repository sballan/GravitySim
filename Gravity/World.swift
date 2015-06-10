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
	
	var sun: Sun!
	var planet: Planet!
	var moon: Body!
	var gravityWell: SKFieldNode?
	
	func update() {
		for child in children {
			if(child.name == "gravityWell") {continue}
		
			child.update()
		}
	}
	
	func createContent() {
		sun = Sun()
		
		planet = Planet()
		planet.position = CGPoint(x: 300, y: 100)
		
		moon = Moon()
		moon.position = CGPoint(x: 310, y: 110)

		
		gravityWell = SKFieldNode.radialGravityField()
		gravityWell?.name = "gravityWell"
		gravityWell!.enabled = true
		gravityWell!.strength = 15
		gravityWell!.falloff = 0
		gravityWell?.categoryBitMask = PhysicalConstants.sunCategory
		

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
