package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;


enum Turn
{
	CPU;
	PLAYER;
}

class PlayState extends FlxState
{
	
	var turn:Turn;
	var player:PlayerLogic;
	var cpu:CPUlogic;
	
	override public function create():Void
	{
		super.create();
		turn = Turn.PLAYER;
		player = new PlayerLogic();
		cpu = new CPUlogic();
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
		
		
		
		switch(turn)
		{
			case Turn.PLAYER:
				{
					if (!player.Update())
					{
						turn = Turn.CPU;
					}
				}
			case Turn.CPU:
				{
					if (!cpu.Update())
					{
						turn = Turn.PLAYER;
					}
					
				}
		}
		
		
	}	
}