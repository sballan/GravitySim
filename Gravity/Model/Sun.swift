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
		self.init(size: CGSize(width: 20, height: 20))
	}
	
	init(size: CGSize) {
		super.init(texture: nil, color: SKColor.yellowColor(), size: size)
		self.bodyName = "sun"
		
		physicsBody?.fieldBitMask = PhysicalConstants.sunCategory
		gravityField.categoryBitMask = PhysicalConstants.planetCategory | PhysicalConstants.moonCategory
		physicsBody?.mass *= 1000000
		
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
}