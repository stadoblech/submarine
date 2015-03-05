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
	
	override public function create():Void
	{
		super.create();
		turn = Turn.PLAYER;
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
					
				}
			case Turn.CPU:
				{
					
				}
		}
		
		
	}	
}