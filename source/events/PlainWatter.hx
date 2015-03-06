package events;
import flixel.util.FlxRandom;
/**
 * ...
 * @author Qerts
 */
class PlainWatter extends Event
{	
	
	public function new() 
	{
		super();
	}
		
	//Vrátí, zda event končí nebo ne.
	override public function isEventEnding():Bool
	{
		return ending;
	}
	
	//Řekne eventu, že by měl skončit a hráč právě hrál své kolo.
	override public function EndEvent()
	{
		ending = true;
	}
	
	//Vrátí, zda má event nějakého následovníka nebo ne.
	override public function DoesContinue():Bool
	{
		return continues;
	}
	
	//Vrátí následovníka funkce.
	override public function GetFollowingEvent():Event
	{
		return null;
	}
	
	//Nastaví počáteční podmínky pro hráče + smaže obrazovku + vypíše na obrazovku nějaký status.
	override public function SetConditions():Void
	{
		//Tento event nemá žádné podmínky.
		GameStatus.Label = startingLabel;
	}
	
	//Zruší počáteční podmínky pro hráče + smaže status.
	override public function UnsetConditions():Void
	{
		//Tento event nemá žádné podmínky.			
	}
	
	//Zareaguje na proměnné vytvářené uživatelem v GameStatus a v závislosti na nich dá uživateli co proto + vypíše výslednou hlášku.
	override public function MakePlayerPay():Void
	{
		GameStatus.Label = endingLabel;			
		var rand = FlxRandom.intRanged(0, 1);
		
		switch (rand) 
		{
			case 0:
				GameStatus.Terror += 1;
			case 1:
				GameStatus.Terror -= 1;					
			default:			
				
		}
	}
		
	
	
}