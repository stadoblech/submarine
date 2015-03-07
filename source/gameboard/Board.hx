package gameboard ;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxTextField;
import flixel.ui.FlxButton;
import neko.Lib;

/**
 * ...
 * @author w
 */
class Board extends FlxSpriteGroup
{
	var attackButton:FlxButton;
	var moveButton:FlxButton;
	var proceedButton:FlxButton;
	var labelBox:FlxTextField;
	
	
	public function new() 
	{
		super();
		
		attackButton = new FlxButton(100, 100, "Attack", proceedAttack);
		add(attackButton);
		
		moveButton = new FlxButton(100, 200, "Move", proceedMove);
		add(moveButton);
		
		proceedButton = new FlxButton(100, 150, "Proceed", proceedProceed);
		add(proceedButton);
		
		labelBox = new FlxTextField(200, 100, 200,  "error", 8, true);
		add(labelBox);
		
	}	
	
	private function proceedProceed():Void
	{
		GameStatus.Proceeded = true;
	}
	
	private function proceedAttack():Void
	{
		GameStatus.TotalActions++;
	}
	
	private function proceedMove():Void
	{
		GameStatus.TotalActions++;
	}
	
	public function setLabel():Void
	{
		labelBox.text = GameStatus.Label;
	}
	
	override public function update():Void 
	{
		labelBox.text = GameStatus.Label;
	}
}