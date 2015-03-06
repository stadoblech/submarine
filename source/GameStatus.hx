package;

/**
 * ...
 * @author Qerts
 */
class GameStatus
{
	//Staty hráče
	public static var Health:Int;
	public static var Energy:Int;
	public static var Label:String;
	public static var Terror:Int;
	public static var Oxygen:Int; //v hodinách
	
	//Staty způsobené hráčem
	public static var Damage:Int;
	public static var Move:Maneuvre;
	
	public static function RestartProperties():Void
	{
		Health = 100;
		Energy = 100;
		Label = "Welcome subexplorer. Find the way to salvation.... or die here, in waste depths of the Titan's Ocean.";
		Terror = 0;
		Oxygen = 240; //na deset dní
		
		
	}
	
	public static function UpdateLayout():Void
	{
		
		
	}
	
	
}

enum Maneuvre
{
	
	
}