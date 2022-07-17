package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import Achievements;
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;

import GameJolt.GameJoltAPI;
import GameJolt;

using StringTools;

class MainMenuStateFlippin extends MusicBeatState
{
	public static var flippinversion:String = 'V2.5';
	public static var psychEngineVersion:String = '0.5.2h'; //This is also used for Discord RPC
	public static var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;

	var editable:Bool = false; // DEBUG THING
    var editbleSprite:FlxSprite;
	var bgshitter:FlxSprite; //so haxe doesnt have a meltdown
	var bgshitter2:FlxSprite;
	var bgshitter3:FlxSprite; 
	var bgshitter4:FlxSprite;
	var bgshitter5:FlxSprite; 
	var bgshitter6:FlxSprite;

	var optionShit:Array<String> = [
		'story_mode',
		'freeplay',
		'options',
		'credits',
		'fish'
	];

	var debugKeys:Array<FlxKey>;

	override function create()
	{
		WeekData.loadTheFirstEnabledMod();

		if (!GameJoltAPI.getStatus())
		{
			GameJoltAPI.connect();
			GameJoltAPI.authDaUser(FlxG.save.data.gjUser, FlxG.save.data.gjToken);
		}
		
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end
		debugKeys = ClientPrefs.copyKey(ClientPrefs.keyBinds.get('debug_1'));

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camAchievement);
		FlxCamera.defaultCameras = [camGame];

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;
		
		bgshitter = new FlxSprite(1, 0); //Storymode 
		bgshitter.frames = Paths.getSparrowAtlas('mainmenu_flippin/bg_story_mode');
		bgshitter.animation.addByPrefix('idle', 'story_mode bg', 24);
		bgshitter.animation.play('idle');
		bgshitter.visible = false;
		add(bgshitter);

		bgshitter2 = new FlxSprite(1, 0); //Freeplay
		bgshitter2.frames = Paths.getSparrowAtlas('mainmenu_flippin/bg_freeplay');
		bgshitter2.animation.addByPrefix('idle', 'freeplay bg', 24);
		bgshitter2.animation.play('idle');
		bgshitter2.visible = false;
		add(bgshitter2);

		bgshitter3 = new FlxSprite(1, 0); //credits
		bgshitter3.frames = Paths.getSparrowAtlas('mainmenu_flippin/bg_credits');
		bgshitter3.animation.addByPrefix('idle', 'credits bg', 24);
		bgshitter3.animation.play('idle');
		bgshitter3.visible = false;
		add(bgshitter3);

		bgshitter4 = new FlxSprite(1, 0); //options
		bgshitter4.frames = Paths.getSparrowAtlas('mainmenu_flippin/bg_options');
		bgshitter4.animation.addByPrefix('idle', 'options bg', 24);
		bgshitter4.animation.play('idle');
		bgshitter4.visible = false;
		add(bgshitter4);

		bgshitter5 = new FlxSprite(1, 0); //fish
		bgshitter5.frames = Paths.getSparrowAtlas('mainmenu_flippin/bg_fish');
		bgshitter5.animation.addByPrefix('idle', 'fish bg', 24);
		bgshitter5.animation.play('idle');
		bgshitter5.visible = false;
		add(bgshitter5);

		bgshitter6 = new FlxSprite(1, 0); //movies
		bgshitter6.frames = Paths.getSparrowAtlas('mainmenu_flippin/bg_movies');
		bgshitter6.animation.addByPrefix('idle', 'cutscenes bg', 24);
		bgshitter6.animation.play('idle');
		bgshitter6.visible = false;
		add(bgshitter6);

		var bg:FlxSprite = new FlxSprite(-14, -20).loadGraphic(Paths.image('mainmenu_flippin/funny board'));
		bg.updateHitbox();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var scale:Float = 1.1;
		/*if(optionShit.length > 6) {
			scale = 6 / optionShit.length;
		}*/

		editable = false;
		editbleSprite = bgshitter;

		for (i in 0...optionShit.length)
		{
			var offset:Float = 108 - (Math.max(optionShit.length, 4) - 3.5) * 60;
			var menuItem:FlxSprite = new FlxSprite(0, (i * 120) + offset);
			menuItem.scale.x = scale;
			menuItem.scale.y = scale;
			menuItem.frames = Paths.getSparrowAtlas('mainmenu_flippin/menu_' + optionShit[i]);
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			switch (i)                                        
			{                                        
				case 0:                        
					menuItem.x = 50;
					menuItem.y = 40;
				case 1:                         
					menuItem.x = 50;
					menuItem.y = 190;
				case 2:                             
					menuItem.x = 180;
					menuItem.y = 290;
				case 3:                            
					menuItem.x = 50;
					menuItem.y = 450;
				case 4:
					menuItem.x = 380;
					menuItem.y = 515;
			}
			//menuItem.screenCenter(X);
			menuItem.y += 30;
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 4) * 0.135;
			if(optionShit.length < 6) scr = 0;
			menuItem.scrollFactor.set(0, scr);
			menuItem.antialiasing = ClientPrefs.globalAntialiasing;
			menuItem.updateHitbox();
		}

		var versionShit:FlxText = new FlxText(12, FlxG.height - 64, 0, "Friday Night Flippin " + flippinversion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(12, FlxG.height - 44, 0, "Psych Engine v" + psychEngineVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(12, FlxG.height - 24, 0, "Friday Night Funkin' v" + Application.current.meta.get('version'), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		// NG.core.calls.event.logEvent('swag').send();

		changeItem();

		super.create();
	}

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		switch (optionShit[curSelected])
		{
			case 'story_mode':
				bgshitter.visible = true;
				bgshitter2.visible = false;
				bgshitter3.visible = false;
				bgshitter4.visible = false;
				bgshitter5.visible = false;
				bgshitter6.visible = false;
			case 'freeplay':
				bgshitter.visible = false;
				bgshitter2.visible = true;
				bgshitter3.visible = false;
				bgshitter4.visible = false;
				bgshitter5.visible = false;
				bgshitter6.visible = false;
			case 'options':
				bgshitter.visible = false;
				bgshitter2.visible = false;
				bgshitter3.visible = true;
				bgshitter4.visible = false;
				bgshitter5.visible = false;
				bgshitter6.visible = false;
			case 'credits':
				bgshitter.visible = false;
				bgshitter2.visible = false;
				bgshitter3.visible = false;
				bgshitter4.visible = true;
				bgshitter5.visible = false;
				bgshitter6.visible = false;
			case 'fish':
				bgshitter.visible = false;
				bgshitter2.visible = false;
				bgshitter3.visible = false;
				bgshitter4.visible = false;
				bgshitter5.visible = true;
				bgshitter6.visible = false;
			case 'movies':
				bgshitter.visible = false;
				bgshitter2.visible = false;
				bgshitter3.visible = false;
				bgshitter4.visible = false;
				bgshitter5.visible = false;
				bgshitter6.visible = true;
		}

		if (FlxG.keys.pressed.SHIFT && editable)
		{
			editbleSprite.x = FlxG.mouse.screenX;
			editbleSprite.y = FlxG.mouse.screenY;
		}
		else if (FlxG.keys.justPressed.C && editable)
		{
			trace(editbleSprite);
		}

		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}
		
		if (!selectedSomethin)
		{
			if (controls.UI_UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.UI_DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			if (controls.ACCEPT)
			{
				if (optionShit[curSelected] == 'donate')
				{
					CoolUtil.browserLoad('https://ninja-muffin24.itch.io/funkin');
				}
				else
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));

					menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
							FlxTween.tween(spr, {alpha: 0}, 0.4, {
								ease: FlxEase.quadOut,
								onComplete: function(twn:FlxTween)
								{
									spr.kill();
								}
							});
						}
						else
						{
							FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
							{
								var daChoice:String = optionShit[curSelected];

								switch (daChoice)
								{
									case 'story_mode':
										MusicBeatState.switchState(new StoryMenuState());
									case 'freeplay':
										MusicBeatState.switchState(new FreeplayState());
									#if MODS_ALLOWED
									case 'mods':
										MusicBeatState.switchState(new ModsMenuState());
									#end
									case 'awards':
										MusicBeatState.switchState(new AchievementsMenuState());
									case 'credits':
										MusicBeatState.switchState(new CreditsAwesome());
									case 'options':
										LoadingState2.loadAndSwitchState(new options.OptionsState());
									case 'fish':
										MusicBeatState.switchState(new Fishing());
									case 'movies':
										MusicBeatState.switchState(new MasterEditorMenu());
								}
							});
						}
					});
				}
			}
			#if desktop
			else if (FlxG.keys.anyJustPressed(debugKeys))
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			#end
		}

		super.update(elapsed);

		menuItems.forEach(function(spr:FlxSprite)
		{
			//spr.screenCenter(X);
		});
	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');
			spr.updateHitbox();

			if (spr.ID == curSelected)
			{
				spr.animation.play('selected');
				var add:Float = 0;
				if(menuItems.length > 4) {
					add = menuItems.length * 8;
				}
				spr.centerOffsets();
			}
		});
	}
}
