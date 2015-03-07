package ;
import flixel.system.debug.Tracker;
import flixel.util.FlxTimer;
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
	
	public function new() 
	{
		
	}
	
	public function Update():Bool
	{
		
		
				
		
		if (GameStatus.TotalActions >= 5) 
		{
			return false;
		}
		
		
		
		//var yourTimer:haxe.Timer = new haxe.Timer(15000); 
		//yourTimer.run = function():Void { _returnValue = false; yourTimer.stop(); }
		timer = new FlxTimer(5.0, setReturnValue, 1);
		
		return _returnValue;
	}
	
	private function setReturnValue(Timer:FlxTimer):Void
	{ 
		_returnValue = false;
		timer.destroy();
	}
}