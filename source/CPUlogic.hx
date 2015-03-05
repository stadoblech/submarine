package ;
import flixel.util.FlxRandom;

/**
 * ...
 * @author w
 */
class CPUlogic
{
	var activeEvent:Event;
	var haveActiveEvent:Bool = false;
	
	public function new() 
	{
		
	}
	
	public function Update():Bool
	{
		if (!haveActiveEvent)
		{
			activeEvent = pickEvent();
			haveActiveEvent = true;
		}
		
		if (activeEvent.isEventEnding())
		{
			haveActiveEvent = false;
		}
		
		return true;		
	}
	
	private function pickEvent():Event
	{
		var rand = FlxRandom.intRanged(0, 4);
		
		if (rand == 0)
		{
			return new Battle();
		}
		
		return null;
	}
}