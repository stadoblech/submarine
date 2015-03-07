package events;

/**
 * ...
 * @author Qerts
 */
class Seaweed4 extends Event
{

	public function new() 
	{
		super();
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
		GameStatus.Label = "Watch out! Wreck ahead! Huge dead ship, like ghost in this green forest.";
		GameStatus.SubmarineView = View.Seaweed_WreckAhead;
		
	}
	
	//Zareaguje na proměnné vytvářené uživatelem v GameStatus a v závislosti na nich dá uživateli co proto + vypíše výslednou hlášku.
	override public function MakePlayerPay():Void
	{		
		var score:Int = 0;
		for (i in GameStatus.Move) 
		{
			if (i == Maneuvre.Left || i == Maneuvre.Right || i == Maneuvre.Up) 
			{
				score++;
			}
			if (i == Maneuvre.Down) 
			{
				score--;
			}
		}
		
		if (score >= 2) 
		{
			GameStatus.Label = "You avoided it in the last moment. You are a good captain, captain.";
			GameStatus.Terror -= 5;
		}else 
		{
			GameStatus.Label = "Wow, that was really close. One inch and you were dead.";
			GameStatus.Terror += 2;
		}
	}
	
}