//
//  GameScene.swift
//  Gravity
//
//  Created by Samuel Ballan on 5/20/15.
//  Copyright (c) 2015 Samuel Ballan. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
	let zUserInterface: CGFloat = 10
	
	var worldLayer = World()
	//let interfaceLayer = InterfaceLayer()
	
	
	override func didMoveToView(view: SKView) {
		self.anchorPoint = CGPointMake(0.5, 0.5)
		setupContent()
	}
	
	func setupContent() {
		self.physicsWorld.contactDelegate = self
		self.backgroundColor = SKColor.blackColor()
		//interfaceLayer.zPosition = zUserInterface
		addChild(worldLayer)
		//addChild(interfaceLayer)
		
	}
	
	
	override func mouseDown(theEvent: NSEvent) {
		worldLayer.moon.physicsBody?.applyForce(CGVectorMake(-10000, 10000))
		
	}
	
	override func didSimulatePhysics() {
		
	}
	
	func centerOnNode(node: SKNode) {
		var positionInScene = convertPoint(node.position, fromNode: node.parent!)
		worldLayer.position = CGPointMake(worldLayer.position.x - positionInScene.x, worldLayer.position.y)
	}
	
	func clear() {
		var newScene = GameScene(size: CGSizeMake(view!.frame.size.width, view!.frame.size.height))
		self.view?.presentScene(newScene)
	}

	
	func didBeginContact(contact: SKPhysicsContact) {
		
	}
	
	func didEndContact(contact: SKPhysicsContact) {
		
	}
    
    override func update(currentTime: CFTimeInterval) {
		for child in children {
			child.update()
		}
	}
	
	
}



