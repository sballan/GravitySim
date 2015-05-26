//
//  Button.swift
//  Gravity
//
//  Created by Samuel Ballan on 5/25/15.
//  Copyright (c) 2015 Samuel Ballan. All rights reserved.
//

import Foundation
import SpriteKit

class ButtonNode: SKNode {
	var text: SKLabelNode!
	var background: SKShapeNode!
	var cornerWidth: CGFloat = 5
	var cornerHeight: CGFloat = 5
	
	var fontColor: SKColor {
		set(newFontColor){self.text.fontColor = newFontColor}
		get{return self.text.fontColor}
	}
	
	var fillColor: SKColor {
		set(newFillColor) {self.background.fillColor = newFillColor}
		get{return self.background.fillColor}
	}
	
	override var name: String? {
		set(newName) {
			self.text.name = newName
			self.background.name = newName
		}
		get{return self.name}
	}
	
	
	convenience init(text: String) {
		self.init(text: text, fontColor: SKColor.whiteColor())
	}

	
	init(text: String, fontColor: SKColor) {
		super.init()
		
		self.text = SKLabelNode(text: text)
		self.text.fontColor = fontColor
		
		self.background = SKShapeNode(rectOfSize: self.text.frame.size)
		self.background.position.y += (self.text.frame.height / 2)
		self.background.xScale = 1.3
		self.background.yScale = 1.5
		
		self.background.fillColor = SKColor.darkGrayColor()
		self.background.lineWidth = 0.1
		
		addChild(self.text)
		addChild(background)
		
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
}
