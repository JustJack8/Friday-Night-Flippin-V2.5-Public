package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSubState;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class GameOverSubstate extends MusicBeatSubstate
{
	public var boyfriend:Boyfriend;
	var camFollow:FlxPoint;
	var camFollowPos:FlxObject;
	var updateCamera:Bool = false;

	var stageSuffix:String = "";
	var thorns:FlxSprite;

	public static var characterName:String = 'bf';
	public static var deathSoundName:String = 'fnf_loss_sfx';
	public static var loopSoundName:String = 'gameOver';
	public static var endSoundName:String = 'gameOverEnd';

	public static var instance:GameOverSubstate;

	public static function resetVariables() {
		if (CharMenuStory.bfmode == 'sen')
		{
			characterName = 'sen';
			deathSoundName = 'fnf_loss_sfx';
			loopSoundName = 'gameOver';
			endSoundName = 'gameOverEnd';
		}
		if (CharMenuStory.bfmode == 'sen-beta')
		{
			characterName = 'sen-beta';
			deathSoundName = 'fnf_loss_sfx';
			loopSoundName = 'gameOver';
			endSoundName = 'gameOverEnd';
		}
		if (CharMenuStory.bfmode == 'sen-alpha')
		{
			characterName = 'sen-alpha';
			deathSoundName = 'fnf_loss_sfx';
			loopSoundName = 'gameOver';
			endSoundName = 'gameOverEnd';
		}
	}

	override function create()
	{
		instance = this;
		PlayState.instance.callOnLuas('onGameOverStart', []);

		super.create();
	}

	public function new(x:Float, y:Float, camX:Float, camY:Float)
	{
		super();

		PlayState.instance.setOnLuas('inGameOver', true);

		Conductor.songPosition = 0;
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('DEATH/normal'));
		bg.antialiasing = true;
		bg.scrollFactor.set();
		bg.screenCenter();
		bg.alpha = 0;
		thorns = new FlxSprite().loadGraphic(Paths.image('DEATH/thorns'));
		thorns.antialiasing = true;
		thorns.scale.set(1.2, 1.1);
		thorns.scrollFactor.set();
		thorns.screenCenter();
		thorns.alpha = 0;
		add(thorns);
		add(bg);

		boyfriend = new Boyfriend(x, y, characterName);
		boyfriend.x += boyfriend.positionArray[0];
		boyfriend.y += boyfriend.positionArray[1];
		add(boyfriend);

		camFollow = new FlxPoint(boyfriend.getGraphicMidpoint().x, boyfriend.getGraphicMidpoint().y);

		FlxG.sound.play(Paths.sound(deathSoundName));
		Conductor.changeBPM(100);
		// FlxG.camera.followLerp = 1;
		// FlxG.camera.focusOn(FlxPoint.get(FlxG.width / 2, FlxG.height / 2));
		FlxG.camera.scroll.set();
		FlxG.camera.target = null;

		boyfriend.playAnim('firstDeath');
		FlxG.camera.flash(FlxColor.WHITE, 0.8);

		var exclude:Array<Int> = [];

		camFollowPos = new FlxObject(0, 0, 1, 1);
		camFollowPos.setPosition(FlxG.camera.scroll.x + (FlxG.camera.width / 2), FlxG.camera.scroll.y + (FlxG.camera.height / 2));
		add(camFollowPos);
		FlxTween.tween(camFollow, {x: boyfriend.getGraphicMidpoint().x, y: boyfriend.getGraphicMidpoint().y}, 3, {ease: FlxEase.quintOut, onComplete: function(twn:FlxTween)
		{
			FlxTween.tween(bg, {alpha: 1}, 0.2, {ease: FlxEase.quintOut});
		}});
	}

	var isFollowingAlready:Bool = false;
	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.sound.music.time > 18988)
		{
			if (thorns.alpha != 0.18)
			thorns.alpha += 0.02;
		}
		else
		{
			if (thorns.alpha != 0)
			thorns.alpha -= 0.02;
		}

		if (FlxG.sound.music.time > 19288 * 3)
		{
			var black:FlxSprite = new FlxSprite().makeGraphic(1280 * 2, 1280 * 2, FlxColor.BLACK);
			black.scrollFactor.set();
			black.screenCenter();
			black.alpha = 0;
			add(black);
			FlxTween.tween(black,{alpha: 1},4 ,{ease: FlxEase.expoInOut});

			FlxG.sound.music.fadeOut(5.5,0);

			new FlxTimer().start(5, function(tmr:FlxTimer)
			{
				FlxG.switchState(new Damn());
			});
		}

		PlayState.instance.callOnLuas('onUpdate', [elapsed]);
		if(updateCamera) {
			var lerpVal:Float = CoolUtil.boundTo(elapsed * 0.6, 0, 1);
			camFollowPos.setPosition(FlxMath.lerp(camFollowPos.x, camFollow.x, lerpVal), FlxMath.lerp(camFollowPos.y, camFollow.y, lerpVal));
		}

		if (controls.ACCEPT)
		{
			endBullshit();
		}

		if (controls.BACK)
		{
			FlxG.sound.music.stop();
			PlayState.deathCounter = 0;
			PlayState.seenCutscene = false;

			if (PlayState.isStoryMode)
				MusicBeatState.switchState(new StoryMenuState());
			else
				MusicBeatState.switchState(new FreeplayState());

			FlxG.sound.playMusic(Paths.music('freakyMenu'));
			PlayState.instance.callOnLuas('onGameOverConfirm', [false]);
		}

		if (boyfriend.animation.curAnim.name == 'firstDeath')
		{
			if(boyfriend.animation.curAnim.curFrame >= 12 && !isFollowingAlready)
			{
				FlxG.camera.follow(camFollowPos, LOCKON, 1);
				updateCamera = true;
				isFollowingAlready = true;
			}

			if (boyfriend.animation.curAnim.finished)
			{
				coolStartDeath();
				boyfriend.startedDeath = true;
			}
		}

		if (FlxG.sound.music.playing)
		{
			Conductor.songPosition = FlxG.sound.music.time;
		}
		PlayState.instance.callOnLuas('onUpdatePost', [elapsed]);
	}

	override function beatHit()
	{
		super.beatHit();

		//FlxG.log.add('beat');
	}

	var isEnding:Bool = false;

	function coolStartDeath(?volume:Float = 1):Void
	{
		FlxG.sound.playMusic(Paths.music(loopSoundName), volume);
	}

	function endBullshit():Void
	{
		if (!isEnding)
		{
			isEnding = true;
			boyfriend.playAnim('deathConfirm', true);
			FlxG.sound.music.stop();
			FlxG.sound.play(Paths.music(endSoundName));
			new FlxTimer().start(0.7, function(tmr:FlxTimer)
			{
				FlxG.camera.fade(FlxColor.BLACK, 2, false, function()
				{
					MusicBeatState.resetState();
				});
			});
			PlayState.instance.callOnLuas('onGameOverConfirm', [true]);
		}
	}
}
