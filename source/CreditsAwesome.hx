import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxSubState;
import flixel.addons.ui.FlxUIInputText;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxColor;
import flixel.FlxG;
import lime.system.System;
import flixel.util.FlxTimer;
import flixel.FlxSprite;
import flixel.ui.FlxBar;

class CreditsAwesome extends MusicBeatSubstate
{
	public static var startSong = true;

    var bg:FlxSprite;
    var editable:Bool = false; // DEBUG THING
    var editbleSprite:FlxSprite;
   
	var curSelected:Int = 0;
    var jars:FlxSprite;
	var neko:FlxSprite;
    var moxx:FlxSprite;
    var dusty:FlxSprite;
    var fart:FlxSprite;
    var vas:FlxSprite;
    var mushit:FlxSprite;
    var progamming:FlxSprite;
    var chartfart:FlxSprite;
    var artlogo:FlxSprite;
    var valogo:FlxSprite;
    var musiclogo:FlxSprite;
    var coderlogo:FlxSprite;
    var charterlogo:FlxSprite;
    var fire:FlxSprite;
    var poly:FlxSprite;
    var aether:FlxSprite;
    var bunny:FlxSprite;
    var verse:FlxSprite;
    var aj:FlxSprite;
    var programmers:FlxSprite; //idk why Dusty made them into one sprite sheet, but oh well
    var sheno:FlxSprite;
    var xotabbyox:FlxSprite;
    var canon:FlxSprite;
    var ruru:FlxSprite;
    var kario:FlxSprite;
    var john:FlxSprite;
    var js:FlxSprite;
    var flan:FlxSprite;
    var squid:FlxSprite;
    var matt:FlxSprite;


    override function create()
        {
            editable = false;
		    editbleSprite = aj;

            if(startSong)
                FlxG.sound.playMusic(Paths.music('decay_chill_mix_wip_1'));
            else
                startSong = true;

            FlxG.mouse.visible = true;

            bg = new FlxSprite().loadGraphic(Paths.image('creditsbutcool/background'));
            bg.setGraphicSize(FlxG.width);
            bg.antialiasing = true;
            bg.screenCenter();
            bg.scrollFactor.set();
            add(bg);

            jars = new FlxSprite(0,0);
			jars.setGraphicSize(FlxG.width);
			jars.frames = Paths.getSparrowAtlas('creditsbutcool/artists', 'preload');
			jars.animation.addByPrefix('idle', "farrists0");
			jars.animation.play('idle');
            jars.antialiasing = true;
            jars.alpha = 1;
            jars.x = 65;
            jars.y = 160;
            jars.scale.set(1, 1);
            jars.updateHitbox();
            jars.scrollFactor.set();
            add(jars);

			neko = new FlxSprite(0, 120);
			neko.setGraphicSize(FlxG.width);
			neko.frames = Paths.getSparrowAtlas('creditsbutcool/artists', 'preload');
			neko.animation.addByPrefix('idle', "farrists1");
			neko.animation.play('idle');
            neko.antialiasing = true;
			neko.alpha = 1;
            neko.x = 65;
            neko.y = 120;
            neko.scale.set(1, 1);
            neko.updateHitbox();
            neko.scrollFactor.set();
            add(neko);

            moxx = new FlxSprite(0,0);
            moxx.setGraphicSize(FlxG.width);
            moxx.frames = Paths.getSparrowAtlas('creditsbutcool/artists', 'preload');
            moxx.animation.addByPrefix('idle', "farrists2");
            moxx.animation.play('idle');
            moxx.antialiasing = true;
            moxx.alpha = 1;
            moxx.x = 100;
            moxx.y = 125;
            moxx.scale.set(1, 1);
            moxx.updateHitbox();
            moxx.scrollFactor.set();
            add(moxx);

            dusty = new FlxSprite(0,0);
            dusty.setGraphicSize(FlxG.width);
            dusty.frames = Paths.getSparrowAtlas('creditsbutcool/artists', 'preload');
            dusty.animation.addByPrefix('idle', "farrists3");
            dusty.animation.play('idle');
            dusty.antialiasing = true;
            dusty.alpha = 1;
            dusty.x = 100;
            dusty.y = 125;
            dusty.scale.set(1, 1);
            dusty.updateHitbox();
            dusty.scrollFactor.set();
            add(dusty);

            fart = new FlxSprite(0,0);
            fart.setGraphicSize(FlxG.width);
            fart.frames = Paths.getSparrowAtlas('creditsbutcool/label artists', 'preload');
            fart.animation.addByPrefix('idle', 'label artists', 24, true);
            fart.animation.play('idle');
            fart.antialiasing = true;
            fart.alpha = 1;
            fart.x = 80;
            fart.y = 100;
            fart.scale.set(1, 1);
            fart.updateHitbox();
            fart.scrollFactor.set();
            add(fart);

            vas = new FlxSprite(0,0);
            vas.setGraphicSize(FlxG.width);
            vas.frames = Paths.getSparrowAtlas('creditsbutcool/label vas', 'preload');
            vas.animation.addByPrefix('idle', 'label vas ', 24, true);
            vas.animation.play('idle');
            vas.antialiasing = true;
            vas.alpha = 1;
            vas.x = 50;
            vas.y = 225;
            vas.scale.set(1, 1);
            vas.updateHitbox();
            vas.scrollFactor.set();
            add(vas);

            artlogo = new FlxSprite().loadGraphic(Paths.image('creditsbutcool/title_artists'));
            artlogo.setGraphicSize(FlxG.width);
            artlogo.antialiasing = true;
            artlogo.alpha = 1;
            artlogo.x = 0;
            artlogo.y -= 50;
            artlogo.scrollFactor.set();
            artlogo.updateHitbox();
            add(artlogo);

            valogo = new FlxSprite().loadGraphic(Paths.image('creditsbutcool/title_voiceactors'));
            valogo.setGraphicSize(FlxG.width);
            valogo.antialiasing = true;
            valogo.alpha = 1;
            valogo.x = 0;
            valogo.y -= 50;
            valogo.scrollFactor.set();
            valogo.updateHitbox();
            add(valogo);

            musiclogo = new FlxSprite().loadGraphic(Paths.image('creditsbutcool/title_musicians'));
            musiclogo.setGraphicSize(FlxG.width);
            musiclogo.antialiasing = true;
            musiclogo.alpha = 1;
            musiclogo.x -= 0;
            musiclogo.y -= 50;
            musiclogo.scrollFactor.set();
            musiclogo.updateHitbox();
            add(musiclogo);

            coderlogo = new FlxSprite().loadGraphic(Paths.image('creditsbutcool/title_programmers'));
            coderlogo.setGraphicSize(FlxG.width);
            coderlogo.antialiasing = true;
            coderlogo.alpha = 1;
            coderlogo.x = 0;
            coderlogo.y -= 50;
            coderlogo.scrollFactor.set();
            coderlogo.updateHitbox();
            add(coderlogo);

            charterlogo = new FlxSprite().loadGraphic(Paths.image('creditsbutcool/title_chartersplaytesters'));
            charterlogo.setGraphicSize(FlxG.width);
            charterlogo.antialiasing = true;
            charterlogo.alpha = 1;
            charterlogo.x = 0;
            charterlogo.y -= 50;
            charterlogo.scrollFactor.set();
            charterlogo.updateHitbox();
            add(charterlogo);

            fire = new FlxSprite(0,0);
            fire.setGraphicSize(FlxG.width);
            fire.frames = Paths.getSparrowAtlas('creditsbutcool/musicians', 'preload');
            fire.animation.addByPrefix('idle', "musicians0000");
            fire.animation.play('idle');
            fire.antialiasing = true;
            fire.alpha = 1;
            fire.x = 50;
            fire.y = 193;
            fire.scale.set(0.9, 0.9);
            fire.updateHitbox();
            fire.scrollFactor.set();
            add(fire);

            poly = new FlxSprite(0,0);
            poly.setGraphicSize(FlxG.width);
            poly.frames = Paths.getSparrowAtlas('creditsbutcool/musicians', 'preload');
            poly.animation.addByPrefix('idle', "musicians0001");
            poly.animation.play('idle');
            poly.antialiasing = true;
            poly.alpha = 1;
            poly.x = 50;
            poly.y = 193;
            poly.scale.set(0.9, 0.9);
            poly.updateHitbox();
            poly.scrollFactor.set();
            add(poly);

            aether = new FlxSprite(0,0);
            aether.setGraphicSize(FlxG.width);
            aether.frames = Paths.getSparrowAtlas('creditsbutcool/musicians', 'preload');
            aether.animation.addByPrefix('idle', "musicians0002");
            aether.animation.play('idle');
            aether.antialiasing = true;
            aether.alpha = 1;
            aether.x = 70;
            aether.y = 193;
            aether.scale.set(0.9, 0.9);
            aether.updateHitbox();
            aether.scrollFactor.set();
            add(aether);

            bunny = new FlxSprite(0,0);
            bunny.setGraphicSize(FlxG.width);
            bunny.frames = Paths.getSparrowAtlas('creditsbutcool/musicians', 'preload');
            bunny.animation.addByPrefix('idle', "musicians0003");
            bunny.animation.play('idle');
            bunny.antialiasing = true;
            bunny.alpha = 1;
            bunny.x = 70;
            bunny.y = 193;
            bunny.scale.set(0.9, 0.9);
            bunny.updateHitbox();
            bunny.scrollFactor.set();
            add(bunny);

            verse = new FlxSprite(0,0);
            verse.setGraphicSize(FlxG.width);
            verse.frames = Paths.getSparrowAtlas('creditsbutcool/musicians', 'preload');
            verse.animation.addByPrefix('idle', "musicians0004");
            verse.animation.play('idle');
            verse.antialiasing = true;
            verse.alpha = 1;
            verse.x = 70;
            verse.y = 163;
            verse.scale.set(0.9, 0.9);
            verse.updateHitbox();
            verse.scrollFactor.set();
            add(verse);

            aj = new FlxSprite(0,0);
            aj.setGraphicSize(FlxG.width);
            aj.frames = Paths.getSparrowAtlas('creditsbutcool/musicians', 'preload');
            aj.animation.addByPrefix('idle', "musicians0005");
            aj.animation.play('idle');
            aj.antialiasing = true;
            aj.alpha = 1;
            aj.x = 130;
            aj.y = 163;
            aj.scale.set(0.9, 0.9);
            aj.updateHitbox();
            aj.scrollFactor.set();
            add(aj);

            mushit = new FlxSprite(0,0);
            mushit.setGraphicSize(FlxG.width);
            mushit.frames = Paths.getSparrowAtlas('creditsbutcool/label musicians', 'preload');
            mushit.animation.addByPrefix('idle', 'label musicians', 24, true);
            mushit.animation.play('idle');
            mushit.antialiasing = true;
            mushit.alpha = 1;
            mushit.x = 0;
            mushit.y = 100;
            mushit.scale.set(1, 1);
            mushit.updateHitbox();
            mushit.scrollFactor.set();
            add(mushit);

            programmers = new FlxSprite(0,0);
            programmers.setGraphicSize(FlxG.width);
            programmers.frames = Paths.getSparrowAtlas('creditsbutcool/programmers', 'preload');
            programmers.animation.addByPrefix('idle', "progamers");
            programmers.animation.play('idle');
            programmers.antialiasing = true;
            programmers.alpha = 1;
            programmers.x = 10;
            programmers.y = 293;
            programmers.scale.set(1, 1);
            programmers.updateHitbox();
            programmers.scrollFactor.set();
            add(programmers);

            progamming = new FlxSprite(0,0);
            progamming.setGraphicSize(FlxG.width);
            progamming.frames = Paths.getSparrowAtlas('creditsbutcool/label_programmers', 'preload');
            progamming.animation.addByPrefix('idle', 'label programmers', 24, true);
            progamming.animation.play('idle');
            progamming.antialiasing = true;
            progamming.alpha = 1;
            progamming.x = 50;
            progamming.y = 100;
            progamming.scale.set(1, 1);
            progamming.updateHitbox();
            progamming.scrollFactor.set();
            add(progamming);

            sheno = new FlxSprite(0,0);
            sheno.setGraphicSize(FlxG.width);
            sheno.frames = Paths.getSparrowAtlas('creditsbutcool/charters', 'preload');
            sheno.animation.addByPrefix('idle', "chart farr0000");
            sheno.animation.play('idle');
            sheno.antialiasing = true;
            sheno.alpha = 1;
            sheno.x = 10;
            sheno.y = 203;
            sheno.scale.set(1, 1);
            sheno.updateHitbox();
            sheno.scrollFactor.set();
            add(sheno);

            flan = new FlxSprite(0,0);
            flan.setGraphicSize(FlxG.width);
            flan.frames = Paths.getSparrowAtlas('creditsbutcool/charters', 'preload');
            flan.animation.addByPrefix('idle', "chart farr0001");
            flan.animation.play('idle');
            flan.antialiasing = true;
            flan.alpha = 1;
            flan.x = 10;
            flan.y = 213;
            flan.scale.set(1, 1);
            flan.updateHitbox();
            flan.scrollFactor.set();
            add(flan);

            squid = new FlxSprite(0,0);
            squid.setGraphicSize(FlxG.width);
            squid.frames = Paths.getSparrowAtlas('creditsbutcool/charters', 'preload');
            squid.animation.addByPrefix('idle', "chart farr0002");
            squid.animation.play('idle');
            squid.antialiasing = true;
            squid.alpha = 1;
            squid.x = 10;
            squid.y = 223;
            squid.scale.set(1, 1);
            squid.updateHitbox();
            squid.scrollFactor.set();
            add(squid);

            matt = new FlxSprite(0,0);
            matt.setGraphicSize(FlxG.width);
            matt.frames = Paths.getSparrowAtlas('creditsbutcool/charters', 'preload');
            matt.animation.addByPrefix('idle', "chart farr0003");
            matt.animation.play('idle');
            matt.antialiasing = true;
            matt.alpha = 1;
            matt.x = 10;
            matt.y = 203;
            matt.scale.set(1, 1);
            matt.updateHitbox();
            matt.scrollFactor.set();
            add(matt);

            chartfart = new FlxSprite(0,0);
            chartfart.setGraphicSize(FlxG.width);
            chartfart.frames = Paths.getSparrowAtlas('creditsbutcool/label charters', 'preload');
            chartfart.animation.addByPrefix('idle', 'label charters', 24, true);
            chartfart.animation.play('idle');
            chartfart.antialiasing = true;
            chartfart.alpha = 1;
            chartfart.x = 50;
            chartfart.y = 100;
            chartfart.scale.set(1, 1);
            chartfart.updateHitbox();
            chartfart.scrollFactor.set();
            add(chartfart);

            xotabbyox = new FlxSprite(0,0);
            xotabbyox.setGraphicSize(FlxG.width);
            xotabbyox.frames = Paths.getSparrowAtlas('creditsbutcool/voice actors', 'preload');
            xotabbyox.animation.addByPrefix('idle', "voicers0000");
            xotabbyox.animation.play('idle');
            xotabbyox.antialiasing = true;
            xotabbyox.alpha = 1;
            xotabbyox.x = 10;
            xotabbyox.y = 323;
            xotabbyox.scale.set(1, 1);
            xotabbyox.updateHitbox();
            xotabbyox.scrollFactor.set();
            add(xotabbyox);

            canon = new FlxSprite(0,0);
            canon.setGraphicSize(FlxG.width);
            canon.frames = Paths.getSparrowAtlas('creditsbutcool/voice actors', 'preload');
            canon.animation.addByPrefix('idle', "voicers0001");
            canon.animation.play('idle');
            canon.antialiasing = true;
            canon.alpha = 1;
            canon.x = 10;
            canon.y = 323;
            canon.scale.set(1, 1);
            canon.updateHitbox();
            canon.scrollFactor.set();
            add(canon);

            john = new FlxSprite(0,0);
            john.setGraphicSize(FlxG.width);
            john.frames = Paths.getSparrowAtlas('creditsbutcool/voice actors', 'preload');
            john.animation.addByPrefix('idle', "voicers0002");
            john.animation.play('idle');
            john.antialiasing = true;
            john.alpha = 1;
            john.x = 10;
            john.y = 313;
            john.scale.set(1, 1);
            john.updateHitbox();
            john.scrollFactor.set();
            add(john);

            js = new FlxSprite(0,0);
            js.setGraphicSize(FlxG.width);
            js.frames = Paths.getSparrowAtlas('creditsbutcool/voice actors', 'preload');
            js.animation.addByPrefix('idle', "voicers0003");
            js.animation.play('idle');
            js.antialiasing = true;
            js.alpha = 1;
            js.x = 10;
            js.y = 313;
            js.scale.set(1, 1);
            js.updateHitbox();
            js.scrollFactor.set();
            add(js);

            ruru = new FlxSprite(0,0);
            ruru.setGraphicSize(FlxG.width);
            ruru.frames = Paths.getSparrowAtlas('creditsbutcool/voice actors', 'preload');
            ruru.animation.addByPrefix('idle', "voicers0005");
            ruru.animation.play('idle');
            ruru.antialiasing = true;
            ruru.alpha = 1;
            ruru.x = 10;
            ruru.y = 318;
            ruru.scale.set(1, 1);
            ruru.updateHitbox();
            ruru.scrollFactor.set();
            add(ruru);

            kario = new FlxSprite(0,0);
            kario.setGraphicSize(FlxG.width);
            kario.frames = Paths.getSparrowAtlas('creditsbutcool/voice actors', 'preload');
            kario.animation.addByPrefix('idle', "voicers0006");
            kario.animation.play('idle');
            kario.antialiasing = true;
            kario.alpha = 1;
            kario.x = 10;
            kario.y = 303;
            kario.scale.set(1, 1);
            kario.updateHitbox();
            kario.scrollFactor.set();
            add(kario);

			changeSelection(0);
            
            var psychButton:FlxButton = new FlxButton(1200, 5, "PSYCH ENGINE CREDITS", function()
            {
                FlxG.switchState(new CreditsState());
            });
            psychButton.scale.set(2, 2);
            add(psychButton);
        }
    override function update(elapsed:Float)
    {
        if (FlxG.sound.music != null)
            Conductor.songPosition = FlxG.sound.music.time;

        if (FlxG.keys.pressed.SHIFT && editable)
        {
            editbleSprite.x = FlxG.mouse.screenX;
            editbleSprite.y = FlxG.mouse.screenY;
        }
        else if (FlxG.keys.justPressed.C && editable)
        {
            trace(editbleSprite);
        }

		
		if (controls.UI_LEFT_P)
		{
			changeSelection(-1);
		}

		if (controls.UI_RIGHT_P)
		{
			changeSelection(1);
		}
        if (controls.BACK)
        {
			FlxG.sound.play(Paths.sound('cancelMenu'));
            FlxG.sound.music.stop();
            FlxG.sound.playMusic(Paths.music('freakyMenu'), 1, true);
			FlxG.switchState(new MainMenuStateFlippin());
			FlxG.mouse.visible = false;
        }
        super.update(elapsed);
    }
	function changeSelection(change:Int = 0)
		{
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

			curSelected += change;

			if (curSelected == 5)
				curSelected = 0;
			if (curSelected == -1)
				curSelected = 4;

            switch (curSelected)
            {
                case 0:
                    fart.alpha = 1;
                    vas.alpha = 0;
                    progamming.alpha = 0;
                    chartfart.alpha = 0;
                    mushit.alpha = 0;
                    dusty.alpha = 1;
                    moxx.alpha = 1;
                    jars.alpha = 1;
                    neko.alpha = 1;
                    artlogo.alpha = 1;
                    valogo.alpha = 0;
                    musiclogo.alpha = 0;
                    coderlogo.alpha = 0;
                    charterlogo.alpha = 0;
                    fire.alpha = 0;
                    poly.alpha = 0;
                    aether.alpha = 0;
                    bunny.alpha = 0;
                    verse.alpha = 0;
                    aj.alpha = 0;
                    programmers.alpha = 0;
                    sheno.alpha = 0;
                    xotabbyox.alpha = 0;
                    canon.alpha = 0;
                    ruru.alpha = 0;
                    kario.alpha = 0;
                    john.alpha = 0;
                    js.alpha = 0;
                    flan.alpha = 0;
                    matt.alpha = 0;
                    squid.alpha = 0;
                case 1:
                    fart.alpha = 0;
                    vas.alpha = 0;
                    progamming.alpha = 0;
                    chartfart.alpha = 0;
                    mushit.alpha = 1;
                    dusty.alpha = 0;
                    moxx.alpha = 0;
                    jars.alpha = 0;
                    neko.alpha = 0;
                    artlogo.alpha = 0;
                    valogo.alpha = 0;
                    musiclogo.alpha = 1; 
                    coderlogo.alpha = 0;
                    charterlogo.alpha = 0;
                    fire.alpha = 1;
                    poly.alpha = 1;
                    aether.alpha = 1; 
                    bunny.alpha = 1; 
                    verse.alpha = 1; 
                    aj.alpha = 1; 
                    programmers.alpha = 0;
                    sheno.alpha = 0;
                    xotabbyox.alpha = 0;
                    canon.alpha = 0;
                    ruru.alpha = 0;
                    kario.alpha = 0;
                    john.alpha = 0;
                    js.alpha = 0;
                    flan.alpha = 0;
                    matt.alpha = 0;
                    squid.alpha = 0;
                case 2:
                    fart.alpha = 0;
                    vas.alpha = 0;
                    progamming.alpha = 1;
                    chartfart.alpha = 0;
                    mushit.alpha = 0;
                    dusty.alpha = 0;
                    moxx.alpha = 0;
                    jars.alpha = 0;
                    neko.alpha = 0;
                    artlogo.alpha = 0;
                    valogo.alpha = 0;
                    musiclogo.alpha = 0; 
                    coderlogo.alpha = 1; 
                    charterlogo.alpha = 0;
                    fire.alpha = 0;
                    poly.alpha = 0;
                    aether.alpha = 0; 
                    bunny.alpha = 0; 
                    verse.alpha = 0; 
                    aj.alpha = 0; 
                    programmers.alpha = 1;
                    sheno.alpha = 0;
                    xotabbyox.alpha = 0;
                    canon.alpha = 0;
                    ruru.alpha = 0;
                    kario.alpha = 0;
                    john.alpha = 0;
                    js.alpha = 0;
                    flan.alpha = 0;
                    matt.alpha = 0;
                    squid.alpha = 0;
                case 3:
                    fart.alpha = 0;
                    vas.alpha = 0;
                    progamming.alpha = 0;
                    chartfart.alpha = 1;
                    mushit.alpha = 0;
                    dusty.alpha = 0;
                    moxx.alpha = 0;
                    jars.alpha = 0;
                    neko.alpha = 0;
                    artlogo.alpha = 0;
                    valogo.alpha = 0;
                    musiclogo.alpha = 0; 
                    coderlogo.alpha = 0; 
                    charterlogo.alpha = 1; 
                    fire.alpha = 0;
                    poly.alpha = 0;
                    aether.alpha = 0; 
                    bunny.alpha = 0; 
                    verse.alpha = 0; 
                    aj.alpha = 0; 
                    programmers.alpha = 0;
                    sheno.alpha = 1;
                    xotabbyox.alpha = 0;
                    canon.alpha = 0;
                    ruru.alpha = 0;
                    kario.alpha = 0;
                    john.alpha = 0;
                    js.alpha = 0;
                    flan.alpha = 1;
                    matt.alpha = 1;
                    squid.alpha = 1;
                case 4:
                    fart.alpha = 0;
                    vas.alpha = 1;
                    progamming.alpha = 0;
                    chartfart.alpha = 0;
                    mushit.alpha = 0;
                    dusty.alpha = 0;
                    moxx.alpha = 0;
                    jars.alpha = 0;
                    neko.alpha = 0;
                    artlogo.alpha = 0;
                    valogo.alpha = 1;
                    musiclogo.alpha = 0; 
                    coderlogo.alpha = 0; 
                    charterlogo.alpha = 0; 
                    fire.alpha = 0;
                    poly.alpha = 0;
                    aether.alpha = 0; 
                    bunny.alpha = 0; 
                    verse.alpha = 0; 
                    aj.alpha = 0; 
                    programmers.alpha = 0;
                    sheno.alpha = 0;
                    xotabbyox.alpha = 1;
                    canon.alpha = 1;
                    ruru.alpha = 1;
                    kario.alpha = 1;
                    john.alpha = 1;
                    js.alpha = 1;
                    flan.alpha = 0;
                    matt.alpha = 0;
                    squid.alpha = 0;
            }
		}
}