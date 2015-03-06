package gameboard ;
import flixel.group.FlxSpriteGroup;
import flixel.ui.FlxButton;

/**
 * ...
 * @author w
 */
class Board extends FlxSpriteGroup
{
	var attackButton:FlxButton;
	var moveButton:FlxButton;
	
	
	public function new() 
	{
		super();
		
		attackButton = new FlxButton(100, 100, "Attack", proceedAttack);
		add(attackButton);
		
		moveButton = new FlxButton(100, 200, "Move", proceedMove);
		add(moveButton);
		
	}	
	
	private function proceedAttack():Void
	{
		
	}
	
	private function proceedMove():Void
	{
		
	}
}