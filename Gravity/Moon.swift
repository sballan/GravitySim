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
		self.init(size: CGSize(width: 5, height: 5))
	}
	
	init(size: CGSize) {
		super.init(texture: nil, color: SKColor.whiteColor(), size: size)
		self.bodyName = "moon"
		
		self.physicsBody?.fieldBitMask = PhysicalConstants.moonCategory
		self.gravityField.categoryBitMask = PhysicalConstants.planetCategory
		self.gravityField.enabled = true
		self.gravityField.strength = 0.0002
		self.physicsBody?.mass = 0.00004
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}