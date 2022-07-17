package;

#if desktop
import Discord.DiscordClient;
import sys.thread.Thread;
#end
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
//import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import openfl.Assets;
import flixel.FlxCamera;
import openfl.utils.Assets as OpenFlAssets;

#if sys
import sys.FileSystem;
#end

using StringTools;

class FlashingState extends MusicBeatState
{
	public static var leftState:Bool = false;
	public var camHUD:FlxCamera;
	public var inCutscene:Bool = false;

	var daVideo:FlxVideo;
	var canAccept = false;

	override public function create():Void
	{
		FlxG.mouse.visible = false;

		var bg = new FlxSprite(-FlxG.width, -FlxG.height).makeGraphic(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
		add(bg);

		camHUD = new FlxCamera();
		camHUD.bgColor.alpha = 0;
		FlxG.cameras.add(camHUD);
		PlayerSettings.init();
		FlxG.save.bind('funkin', 'ninjamuffin99');
		ClientPrefs.loadPrefs();
		Highscore.load();

		startVideo('klaskiiTitle');
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (inCutscene && controls.ACCEPT && ClientPrefs.seenvid)
		{
			startAndEnd();
		}
	}

	public function startVideo(name:String):Void {
		#if VIDEOS_ALLOWED
		var foundFile:Bool = false;
		var fileName:String = #if MODS_ALLOWED Paths.modFolders('videos/' + name + '.' + Paths.VIDEO_EXT); #else ''; #end
		#if sys
		if(FileSystem.exists(fileName)) {
			foundFile = true;
		}
		#end

		if(!foundFile) {
			fileName = Paths.video(name);
			#if sys
			if(FileSystem.exists(fileName)) {
			#else
			if(OpenFlAssets.exists(fileName)) {
			#end
				foundFile = true;
			}
		}

		new FlxTimer().start(1.5, function(tmr:FlxTimer)
		{
			canAccept = true;
		});

		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			if(foundFile) {
				inCutscene = true;
				var bg = new FlxSprite(-FlxG.width, -FlxG.height).makeGraphic(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
				bg.scrollFactor.set();
				bg.cameras = [camHUD];
				add(bg);
	
				(daVideo = new FlxVideo(fileName)).finishCallback = function() {
					remove(bg);
					startAndEnd();
				}
				return;
			}
			else
			{
				FlxG.log.warn('Couldnt find video file: ' + fileName);
				startAndEnd();
			}
			#end
			startAndEnd();
		});
	}

	function startAndEnd()
	{
		inCutscene = false;
		daVideo.muted = true;
		daVideo.finishCallback = null;
		if(!ClientPrefs.seenvid)
			ClientPrefs.seenvid = true;
		ClientPrefs.saveSettings();
		MusicBeatState.switchState(new TitleState());
		leftState = true;
	}
}