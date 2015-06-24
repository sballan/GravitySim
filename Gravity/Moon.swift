//
//  Moon.swift
//  Gravity
//
//  Created by Samuel Ballan on 6/10/15.
//  Copyright (c) 2015 Samuel Ballan. All rights reserved.
//

import Foundation
import SpriteKit

class Moon: Body {
	
	convenience init() {
		self.init(size: CGSize(width: 4, height: 4))
	}
	
	init(size: CGSize) {
		super.init(texture: nil, color: SKColor.whiteColor(), size: size)
		
		self.gravityStrength = 0.0000000001
		self.massMultiplier = 0.001
		self.bodyName = "moon"
		
		self.physicsBody?.fieldBitMask = PhysicalConstants.planetCategory | PhysicalConstants.sunCategory
		self.physicsBody?.contactTestBitMask = PhysicalConstants.planetCategory | PhysicalConstants.sunCategory
		self.physicsBody?.categoryBitMask = PhysicalConstants.moonCategory
		
		self.gravityField.categoryBitMask = PhysicalConstants.moonCategory
		self.gravityField.enabled = true
		self.gravityField.strength = gravityStrength!
		self.physicsBody?.mass *= massMultiplier!
		self.physicsBody?.restitution = 0.9
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}