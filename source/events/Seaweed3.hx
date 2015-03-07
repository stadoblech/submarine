package events;
import flixel.util.FlxRandom;
/**
 * ...
 * @author Qerts
 */
class Seaweed3 extends Event
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
				return null;
			case 1:
				return new Seaweed1();
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
		GameStatus.Label = "And suddenly seest something huge. And living. It seems that it have noticed your little submarine and getting closer to you.";
		GameStatus.SubmarineView = View.Seaweed_AliveMenace;
		
	}
	
	//Zareaguje na proměnné vytvářené uživatelem v GameStatus a v závislosti na nich dá uživateli co proto + vypíše výslednou hlášku.
	override public function MakePlayerPay():Void
	{		
		if (GameStatus.Damage <= 10) 
		{
			GameStatus.Label = "You only made it angry. Something hit your pig boat and threw it away like a toy.";
			GameStatus.Terror += 5;
			GameStatus.Health -= 10;
			
		}else 
		{
			if (GameStatus.Damage <= 20) 
			{
				GameStatus.Label = "You are fortunate. Sea monster fled in fear.";
				GameStatus.Terror -= 5;
			}else 
			{
				GameStatus.Label = "Mighty captain, you have another tally on your rudder. Beasts intestines are all around you. They kinda react with your hull.";
				GameStatus.Terror -= 10;
				GameStatus.Health += 10;
			}
		}
				
		
		
	}
	
}