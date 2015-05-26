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
	var cornerWidth: CGFloat = 4
	var cornerHeight: CGFloat = 4
	
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
		self.init(text: text, fillColor: SKColor.darkGrayColor())
	}
	
	convenience init(text: String, fillColor: SKColor) {
		self.init(text: text, fontColor: SKColor.whiteColor(), fillColor: fillColor)
	}
	
	init(text: String, fontColor: SKColor, fillColor: SKColor) {
		super.init()
		

		
		self.text = SKLabelNode(text: text)
		
		let textFrame = self.text.frame
		var sizeRect = CGRectMake(textFrame.origin.x, textFrame.origin.y, textFrame.width, textFrame.height)
		
		self.background = SKShapeNode(path: CGPathCreateWithRoundedRect(sizeRect, self.cornerWidth, self.cornerHeight, nil))
		
		self.background.position.y -= 5
		self.background.xScale = 1.3
		self.background.yScale = 1.5
		self.background.lineWidth = 0.1
		
		self.fillColor = fillColor
		self.fontColor = fontColor
		
		addChild(self.text)
		addChild(background)
		
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
}
