package ;
import events.*;
import events.marvellousCave.MarvellousCave1;
import flixel.util.FlxRandom;
import gameboard.Board;

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
	public function Update(role:Int):Bool
	{		
		switch (role) 
		{
			case 1:
				{
					trace("@>>>> First Event Part Launched");
					if (!haveActiveEvent)
					{
						trace("@>>>> New Event Picked");
						GameStatus.Proceeded = false;			//čeká na proceed
						activeEvent = pickEvent();				//vybere novu událost
						GameStatus.RestartPlayerStats();		//vynuluje změny způsobené hráčem
						activeEvent.SetConditions();			//nastaví změny prostředí
						Board.UpdateLabel();					//vypíše text
						haveActiveEvent = true;					//změní stav aktivní události na true
						activeEvent.UnEndEvent();				//nastavit nekončení eventu
						return true;							//skončí neúspěšně
					}else 
					{
						if (GameStatus.Proceeded) 
						{
							trace("@>>>> First Event Part Stopped");
							return false;						//proceed, skončí úspěšně
						}else 
						{
							return true;
						}
					}
				}
			case 2:
				{		
					
					trace("@>>>> Second Event Part Launched" + activeEvent.isEventEnding());
					if (!activeEvent.isEventEnding()) 
					{
						trace("@>>>> Second Event Part Processed");
						GameStatus.Proceeded = false;				//čeká na proceed
						GameStatus.Oxygen--;						//ubere jeden kyslík
						activeEvent.UnsetConditions();				//zruší změny prostředí
						activeEvent.MakePlayerPay();				//ovlivní hráče
						Board.UpdateLabel();						//aktualizuje text
						haveActiveEvent = false;					//zruší aktivní event
						activeEvent.EndEvent();						//ukončí událost
						return true;								//skončí neúspěšně		
					}else 
					{
						if (GameStatus.Proceeded) 
						{
							trace("@>>>> Second Event Part Stopped");
							return false;						//proceed, skončí úspěšně
						}else 
						{
							return true;
						}
					}
				}
			default:
				return true;
				
		}		
	}
	
	
	//Funkce pro výběr eventu.
	private function pickEvent():Event
	{
		var rand = FlxRandom.intRanged(2, 2);
		
		//Má předchozí event pokračování? Pokud ano, pokračovat.
		if (activeEvent != null) 
		{
			
			if (activeEvent.DoesContinue()) 
			{
				trace("@>>>>> Event Continued");
				var returnValue:Event = activeEvent.GetFollowingEvent();
				if (returnValue != null) 
				{
					return returnValue;
				}
			}
		}
		
		
		//Předchozí event nemá pokračování a je náhodně vybrána další událost.
		switch (rand) 
		{
			
			case 0:
				return new PlainWatter();	
			case 1:
				return new Seaweed1();
			case 2:
				return new MarvellousCave1();
			default:
				return new PlainWatter();
				
		}
		
		return null;
	}
	
}