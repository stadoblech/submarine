package events;
import flixel.util.FlxRandom;

/**
 * ...
 * @author Qerts
 */
class Seaweed2 extends Event
{

	public function new() 
	{
		super();
		continues = true;
	}	
	
	
	//Vrátí následovníka funkce.
	override public function GetFollowingEvent():Event
	{
		var rand = FlxRandom.intRanged(1, 2);
		switch (rand) 
		{				
			case 1:
				return new Seaweed3();
			case 2:
				return new Seaweed4();
			default:
				return null;
		}
	}
	
	//Nastaví počáteční podmínky pro hráče + smaže obrazovku + vypíše na obrazovku nějaký status.
	override public function SetConditions():Void
	{
		//Tento event nemá žádné podmínky.
		GameStatus.Label = "More and more seaweed. Like thousands tentacles, penetrating the darkness.";
		GameStatus.SubmarineView = View.Seaweed;
		
	}
	
	//Zareaguje na proměnné vytvářené uživatelem v GameStatus a v závislosti na nich dá uživateli co proto + vypíše výslednou hlášku.
	override public function MakePlayerPay():Void
	{		
		switch (GameStatus.Speed) 
		{
			case 1:
				GameStatus.Label = "You are going through slowly. Something flashed in front of your submarine. Something alive.";
			case 2:
				GameStatus.Label = "You are going through slowly. Something flashed in front of your submarine. Something alive.";
				GameStatus.Terror--;
			case 3:
				GameStatus.Label = "You are going through. Something flashed in front of your submarine. Something alive.";
				GameStatus.Terror++;
			case 4:
				GameStatus.Label = "You are going through. Something flashed in front of your submarine. Something alive.";
				GameStatus.Health--;
			case 5:
				GameStatus.Label = "You hit something. Something alive. Something big. Something with more eyes than is natural. And all those eyes staring at you.";
				GameStatus.Health -= 2;
				GameStatus.Terror += 2;
			case 6:
				GameStatus.Label = "You hit something. Something alive. Something big. Something with more eyes than is natural. And all those eyes staring at you.";
				GameStatus.Health -= 2;
				GameStatus.Terror += 2;
			case 7:
				GameStatus.Label = "You hit something. Something alive. Something big. Something with more eyes than is natural. And all those eyes staring at you.";
				GameStatus.Health -= 3;
				GameStatus.Terror += 2;
			case 8:
				GameStatus.Label = "You hit something. Something alive. Something big. Something with more eyes than is natural. And all those eyes staring at you.";
				GameStatus.Health -= 4;
				GameStatus.Terror += 2;
			case 9:
				GameStatus.Label = "You hit something. Something alive. Something big. Something with more eyes than is natural. And all those eyes staring at you.";
				GameStatus.Health -= 5;
				GameStatus.Terror += 3;
			case 10:
				GameStatus.Label = "You hit something. Something alive. Something big. Something with more eyes than is natural. And all those eyes staring at you.";
				GameStatus.Health -= 6;
				GameStatus.Terror += 3;
			default:	
				
		}
	}
	
}