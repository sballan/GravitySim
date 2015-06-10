//
//  Planet.swift
//  Gravity
//
//  Created by Samuel Ballan on 6/10/15.
//  Copyright (c) 2015 Samuel Ballan. All rights reserved.
//

import Foundation
import SpriteKit

class Planet: Body {
	
	
	convenience init() {
		self.init(size: CGSize(width: 10, height: 10))
	}
	
	init(size: CGSize) {
		super.init(texture: nil, color: SKColor.lightGrayColor(), size: size)
		self.bodyName = "planet"
		
		physicsBody?.fieldBitMask = PhysicalConstants.planetCategory
		gravityField.categoryBitMask = PhysicalConstants.sunCategory | PhysicalConstants.moonCategory
		
		
		self.gravityField.enabled = true
		self.gravityField.strength = 1
		self.physicsBody?.mass = 0.01
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
