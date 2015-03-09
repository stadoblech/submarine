package ;
import flixel.system.debug.Tracker;
import flixel.util.FlxTimer;
import gameboard.Board;
import haxe.Timer;

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
				Board.UpdateLimit(Std.string(Std.int(timer.timeLeft)) + "/" + Std.string(Std.int(timer.time)), MAXACTIONS);
		if (GameStatus.TotalActions >= MAXACTIONS) 
		{
			return false;
		}
		
		
		
		return _returnValue;
	}
	
	private function setReturnValue(Timer:FlxTimer):Void
	{ 
		_returnValue = false;
		timer.destroy();
	}
}