//
//  Sun.swift
//  Gravity
//
//  Created by Samuel Ballan on 6/10/15.
//  Copyright (c) 2015 Samuel Ballan. All rights reserved.
//

import Foundation
import SpriteKit

class Sun: Body {
	
	
	convenience init() {
		self.init(size: CGSize(width: 25, height: 25))
	}
	
	init(size: CGSize) {
		super.init(texture: nil, color: SKColor.yellowColor(), size: size)
		
		self.massMultiplier = 1000000
		self.gravityStrength = 5
		self.bodyName = "sun"
		
		physicsBody?.fieldBitMask = PhysicalConstants.moonCategory | PhysicalConstants.planetCategory | PhysicalConstants.wellCategory
		physicsBody?.categoryBitMask = PhysicalConstants.sunCategory
		physicsBody?.contactTestBitMask = PhysicalConstants.moonCategory | PhysicalConstants.planetCategory
		
		gravityField.categoryBitMask = PhysicalConstants.sunCategory
		println("Gravity Field Strength: \(gravityField.strength)")
		gravityField.strength = gravityStrength!
		physicsBody?.mass *= massMultiplier!
		
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
}