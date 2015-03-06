package ;
import events.*;
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
	
	//Pokud nemá logika aktivní event, tak nějaký vybere. Nastaví podmínky eventu a nastaví si aktivní událost jako true.
	//Pokud má logika aktivní event a event končí, tak vynuluje podmínky a reaguje na vstupy uživatele. Event se nenuluje,
	//aby bylo možné případně na event navazovat.
	public function Update():Bool
	{
		if (!haveActiveEvent)
		{
			activeEvent = pickEvent();
			activeEvent.SetConditions();
			haveActiveEvent = true;
		}else
		{		
			if (activeEvent.isEventEnding())
			{
				activeEvent.UnsetConditions();
				activeEvent.MakePlayerPay();
				haveActiveEvent = false;
			}
		}
		return true;		
	}
	
	
	//Funkce pro výběr eventu.
	private function pickEvent():Event
	{
		var rand = FlxRandom.intRanged(0, 4);
		
		//Má předchozí event pokračování? Pokud ano, pokračovat.
		if (activeEvent.DoesContinue()) 
		{
			return activeEvent.GetFollowingEvent();
		}
		
		
		//Předchozí event nemá pokračování a je náhodně vybrána další událost.
		switch (rand) 
		{
			case 0:
				return new PlainWatter();
				
			default:
				return new PlainWatter();
				
		}
		
		return null;
	}
	
	public function SetEnding():Void
	{
		activeEvent.EndEvent();
	}
}