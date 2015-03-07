package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import gameboard.Board;
import neko.Lib;


enum Turn
{
	CPUFIRST;
	CPUSECOND;
	PLAYER;
}

class PlayState extends FlxState
{
	
	var turn:Turn;
	var player:PlayerLogic;
	var cpu:CPUlogic;
	
	var board:Board;
	
	override public function create():Void
	{
		super.create();
		turn = Turn.CPUFIRST;
		cpu = new CPUlogic();
		
		board = new Board();
		add(board);
		
		GameStatus.RestartProperties();
		
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
		
		//Lib.println("@>> Submarine updated >>");
		
		switch(turn)
		{
			case Turn.PLAYER:
				{		
					
					if (!player.Update())
					{
						Lib.println("@>>> Player Turn");
						turn = Turn.CPUSECOND;
					}					
				}
			case Turn.CPUFIRST:
				{
					
					if (!cpu.Update(1))
					{
						Lib.println("@>>> CPUFIRST Turn");
						turn = Turn.PLAYER;
						player = new PlayerLogic();
					}
					
				}
			case Turn.CPUSECOND:
				{
					
					if (!cpu.Update(2))
					{
						Lib.println("@>>> CPUSECOND Turn");
						turn = Turn.CPUFIRST;
					}
					
				}
		}		
	}	
}