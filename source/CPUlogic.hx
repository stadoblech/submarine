package ;
import events.*;
import flixel.util.FlxRandom;
import gameboard.Board;
import neko.Lib;

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
			Lib.println("@>>>> New Event Picked");
			activeEvent = pickEvent();
			GameStatus.RestartPlayerStats();
			activeEvent.SetConditions();
			haveActiveEvent = true;
			return false;
		}else
		{		
			if (activeEvent.isEventEnding())
			{
				Lib.println("@>>>> Second Event Part Launched");
				activeEvent.UnsetConditions();
				activeEvent.MakePlayerPay();
				haveActiveEvent = false;
				return false;
			}
		}
		return true;		
	}
	
	
	//Funkce pro výběr eventu.
	private function pickEvent():Event
	{
		var rand = FlxRandom.intRanged(0, 0);
		
		//Má předchozí event pokračování? Pokud ano, pokračovat.
		if (activeEvent != null) 
		{
			
			if (activeEvent.DoesContinue()) 
			{
				Lib.println("@>>>>> Event Continued");
				return activeEvent.GetFollowingEvent();
			}
		}
		
		
		//Předchozí event nemá pokračování a je náhodně vybrána další událost.
		switch (rand) 
		{
			
			case 0:
				Lib.println("@>>>>> Random Event Picked");
				return new PlainWatter();				
			default:
				return new PlainWatter();
				
		}
		
		return null;
	}
	
	public function SetEnding():Void
	{
		Lib.println("@>>>>> Event Ended");
		activeEvent.EndEvent();
	}
}