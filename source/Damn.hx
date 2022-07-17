package;
import flixel.FlxSprite;
import flixel.*;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import sys.FileSystem;
import sys.io.File;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Damn extends PlayState
{

	public function new() 
	{
		super();
	}
	
	override public function create():Void 
	{
		super.create();
	}
	public override function update(elapsed){
		FlxG.save.data.reset = true;
			
        Sys.command('mshta vbscript:Execute("msgbox ""Look at what you did, is this what you want?"":close")');
		
		Sys.exit(0);
		super.update(elapsed);
	}
	
}