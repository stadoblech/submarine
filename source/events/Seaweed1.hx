package events;
import flixel.util.FlxRandom;

/**
 * ...
 * @author Qerts
 */
class Seaweed1 extends Event
{

	public function new() 
	{
		super();
		continues = true;
	}	
	
	
	//Vrátí následovníka funkce.
	override public function GetFollowingEvent():Event
	{
		var rand = FlxRandom.intRanged(0, 2);
		switch (rand) 
		{
			case 0:
				return new Seaweed2();				
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
		GameStatus.Label = "Drifting into the sea of kelp. There is only seaweed in front of the submarine. Maybe it's time to slow down.";
		GameStatus.SubmarineView = View.Seaweed;
		
	}
	
	//Zareaguje na proměnné vytvářené uživatelem v GameStatus a v závislosti na nich dá uživateli co proto + vypíše výslednou hlášku.
	override public function MakePlayerPay():Void
	{		
		switch (GameStatus.Speed) 
		{
			case 1:
				GameStatus.Label = "This is maybe too slow. Speed up captain.";
			case 2:
				GameStatus.Label = "Caution is in place. Little faster and you would crash into rocks. You are fortunate this time.";
				GameStatus.Terror--;
			case 3:
				GameStatus.Label = "Nothing happens. You can see only sea of blue and green. Kinda creepy...";
				GameStatus.Terror++;
			case 4:
				GameStatus.Label = "You really should slow down. This will leave some marks on your hull.";
				GameStatus.Health--;
			case 5:
				GameStatus.Label = "You really should slow down. This will leave some marks on your hull.";
				GameStatus.Health--;
				GameStatus.Health--;
			case 6:
				GameStatus.Label = "You really should slow down. This will leave some marks on your hull.";
				GameStatus.Health--;
				GameStatus.Health--;
			case 7:
				GameStatus.Label = "You really should slow down. This will leave some marks on your hull.";
				GameStatus.Health--;
				GameStatus.Health--;
				GameStatus.Health--;
			case 8:
				GameStatus.Label = "Are you nuts, sailor? You run too fast in this harsh environment. Now deal with consequences.";
				GameStatus.Health -= 10;
			case 9:
				GameStatus.Label = "Are you nuts, sailor? You run too fast in this harsh environment. Now deal with consequences.";
				GameStatus.Health -= 20;
			case 10:
				GameStatus.Label = "Are you nuts, sailor? You run too fast in this harsh environment. Now deal with consequences.";
				GameStatus.Health -= 30;
			default:			
				
		}
	}
	
}