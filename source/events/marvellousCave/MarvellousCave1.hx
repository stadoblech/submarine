package events.marvellousCave;
using flixel.util.FlxRandom;

/**
 * ...
 * @author Qerts
 */
class MarvellousCave1 extends Event
{

	public function new() 
	{
		super();
		continues = true;
	}	
	
	
	//Vrátí následovníka funkce.
	override public function GetFollowingEvent():Event
	{
		var rand = FlxRandom.intRanged(0, 0);
		switch (rand) 
		{
			case 0:
				return new MarvellousCave2();				
			case 1:
				return new MarvellousCave3();
			case 2:
				return new MarvellousCave4();
			default:
				return null;
		}
	}
	
	//Nastaví počáteční podmínky pro hráče + smaže obrazovku + vypíše na obrazovku nějaký status.
	override public function SetConditions():Void
	{
		//Tento event nemá žádné podmínky.
		/*GameStatus.Label = "Strong waves throw with yer pig boat like with toy ship. It's matter of time, when it will be crashed of some rocks. All of the sudden ye see pathway between cliffs and lead yer" 
		+ " submarine right there. When ye are out of danger, ye see pink flare all around you. With closer look, there are hundreds and hundreds"
		+ " luminiscent little crystals. Dey enlighten cave entrance. Water flows into it, so it could be underwter tunnel. Ye can't turn back, this is your only chance.";
		*/
		GameStatus.Label = "Silny proudy hazi s tvou ponorkou jako s hrackou. Je otazka casu, nez ji rozdrti o nejake skaly. Z niceho nic vidis cestu mezi utesy a zamiris se svou ponorkou primo k ni." 
		+ " Kdyz jsi mimo nebezpeci, vsimnes si ruzove zare vsude okolo tebe. Pri blizsim pohledu ji vydavají stovky a stovky"
		+ " malickych zaricich krystalu. Voda proudí dovnitr, takze by to mohl byt podvodni tunel. Stejne se nemuzes vratit zpet, tohle je jedina sance...";
		GameStatus.SubmarineView = View.MarvellousCave_Entrance;
		
	}	
	
	//Zareaguje na proměnné vytvářené uživatelem v GameStatus a v závislosti na nich dá uživateli co proto + vypíše výslednou hlášku.
	override public function MakePlayerPay():Void
	{		
		var shot:Bool = false;
		var quickEnough:Bool = false;
		var rightMove:Bool = false;
		var wrongMove:Bool = false;
		
		GameStatus.Label = "";		
		
		var rate:Int = 0;
		
		//Vyhodnocení rychlosti
		switch (GameStatus.Speed) 
		{
			case 1:
				rate++;
			case 2:
				rate++;
			case 3:
				rate++;
			case 4:
				rate++;
			case 5:
				rate--;
			case 6:
				rate--;
			case 7:
				rate--;
			case 8:
				rate--;
			case 9:
				rate--;
			case 10:
				rate--;
			default:
				rate--;
		}
		//Vyhodnocení směrů
		for (i in GameStatus.Move) 
		{
			switch (i) 
			{
				case Maneuvre.Down:
					rate--;
					wrongMove = true;
				case Maneuvre.Left:
					rate--;
					wrongMove = true;
				case Maneuvre.Right:
					rate--;
					wrongMove = true;
				case Maneuvre.Up:	
					rate--;
					wrongMove = true;
				default:
					
			}
		}
		//Vyhodnocení dmg
		switch (GameStatus.Damage) 
		{
			case 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10:
				shot = true;
				rate--;
			case 11, 12, 13, 14, 16, 17, 18, 19, 20:
				shot = true;
				rate--;
			case 21, 22, 23, 24, 25, 26, 27, 28, 29, 30:
				shot = true;
				rate--;
			case 31, 32, 33, 34, 35, 36, 37, 38, 39, 40:
				shot = true;
				rate--;
			default:
				
		}
		//Speciální vyhodnocení
		if (shot) 
		{
			//GameStatus.Label += "Ouch, captain. Don't shot in caves! It could be dangerous... ye know...";
			GameStatus.Label += "Ou, kapitane. V jeskyních nestrilej! Muze to byt nebezpecne... vsak vís...";
		}
		if (quickEnough) 
		{
			
		}
		if (rightMove) 
		{
			
		}
		if (wrongMove) 
		{
			//GameStatus.Label += "Anyway, what ye think ya doing, captain? Dese maneuvers are very unsafe in place like this. Now ye damaged yer ship, lad.";
			GameStatus.Label += "Nicmene, co si myslis, ze delas, kapitane? Tyhle manevry nejsou na miste, jako je tohle, bezpecne. Ted sis poskodil lod, chlape.";
			GameStatus.Health -= 5;
		}
		
		//Vyhodnocení ratu
		if (rate < 0) 
		{
			rate = 0;
		}
		switch (rate) 
		{
			case 0:
				//GameStatus.Label += "Dis doesn't look well sir. Yer submarine is maybe too large for this tunnel... or for ye to handle. Dis will leave some scars. Anyway, don't ye think this is kinda creepy, captain? Dis shiny tunnel is really ... pinky. And thin too.";
				GameStatus.Label += "Tohle nevypada dobre, pane. Tvoje ponorka je mozna prilis velka, aby se vlezla do tunelu... nebo abys ji zvladl. Tohle necha par sramu. Nicmene, nemyslis, ze je to tady dost desive, kapitane? Tendlenc zarivy tunel je opravdu... ruzovy. A taky uzky.";
				GameStatus.Health -= 5;
				GameStatus.Terror--;
			case 1:
				//GameStatus.Label += "Don't ye think this is kinda creepy, captain? Dis shiny tunnel is really ... pinky. And thin too.";
				GameStatus.Label += "Nemyslis, ze je to tady dost desive, kapitane? Tendlenc zarivy tunel je opravdu... ruzovy. A taky uzky.";
				GameStatus.Terror--;
			case 2:
			case 3:
			case 4:
			case 5:
			case 6:
			case 7:
			case 8:
			case 9:
			case 10:
			case 11:
			case 12:
			case 13:
			case 14:
			case 15:
			case 16:
			case 17:
			case 18:
			case 19:
			case 20:
			case 21:
			case 22:
			case 23:
			case 24:
			case 25:
			case 26:
			case 27:
			case 28:
			case 29:
			case 30:
				
				
			default:
				
		}
	}
	
}