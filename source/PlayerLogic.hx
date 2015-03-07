package ;
import flixel.system.debug.Tracker;
import flixel.util.FlxTimer;
import gameboard.Board;
import haxe.Timer;
import neko.Lib;

/**
 * ...
 * @author w
 */
class PlayerLogic
{
	private var _returnValue:Bool = true;
	var timer:FlxTimer;
	var MAXACTIONS:Int = 5;
	
	public function new() 
	{
		timer = new FlxTimer(20.0, setReturnValue, 1);
		GameStatus.RestartPlayerStats();
	}
	
	public function Update():Bool
	{		
		if (GameStatus.TotalActions >= MAXACTIONS) 
		{
			Board.UpdateLimit(Std.string(Std.int(timer.timeLeft)) + "/" + Std.string(Std.int(timer.time)), MAXACTIONS);
			return false;
		}
		
		Board.UpdateLimit(Std.string(Std.int(timer.timeLeft)) + "/" + Std.string(Std.int(timer.time)), MAXACTIONS);
		
		
		return _returnValue;
	}
	
	private function setReturnValue(Timer:FlxTimer):Void
	{ 
		_returnValue = false;
		timer.destroy();
	}
}