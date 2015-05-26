//
//  InterfaceLayer.swift
//  Gravity
//
//  Created by Samuel Ballan on 5/21/15.
//  Copyright (c) 2015 Samuel Ballan. All rights reserved.
//

import Foundation
import SpriteKit

class Interface: SKNode {
	var resetButton: ButtonNode!
	
	func createContent() {
		resetButton = ButtonNode(text: "Reset")
		resetButton.name = "resetButton"
		resetButton.position = CGPoint(x: 0, y: -(scene!.frame.height) / 2 + resetButton.frame.height + 30)
		addChild(resetButton)
		
		
	}
	
	
	func update() {
	
	}
	
	override init() {
		super.init()
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
}