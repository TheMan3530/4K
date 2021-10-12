package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;

	public var finishThing:Void->Void;

	var portraitLeft:FlxSprite;
	var portraitRight:FlxSprite;
	var portraitBurger:FlxSprite;
	var portraitAnaBF:FlxSprite;
	var portraitAna:FlxSprite;
	var portraitForgor:FlxSprite;
	var portraitSans:FlxSprite;

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				FlxG.sound.playMusic(Paths.music('Lunchbox'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'thorns':
				FlxG.sound.playMusic(Paths.music('LunchboxScary'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'placeholder':
				FlxG.sound.playMusic(Paths.music('place'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'sus':
				FlxG.sound.playMusic(Paths.music('trollman'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'ballistix':
				FlxG.sound.playMusic(Paths.music('sans'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);	
			case 'caught':
				FlxG.sound.playMusic(Paths.music('trollman'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);	
			case 'forkay':
				FlxG.sound.playMusic(Paths.music('trollman2'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'trolled':
				FlxG.sound.playMusic(Paths.music('trollman3'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);	
		}

		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		new FlxTimer().start(0.83, function(tmr:FlxTimer)
		{
			bgFade.alpha += (1 / 5) * 0.7;
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 5);

		box = new FlxSprite(-20, 45);
		
		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
			case 'roses':
				hasDialog = true;
				FlxG.sound.play(Paths.sound('ANGRY_TEXT_BOX'));

				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-senpaiMad');
				box.animation.addByPrefix('normalOpen', 'SENPAI ANGRY IMPACT SPEECH', 24, false);
				box.animation.addByIndices('normal', 'SENPAI ANGRY IMPACT SPEECH', [4], "", 24);

			case 'thorns':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-evil');
				box.animation.addByPrefix('normalOpen', 'Spirit Textbox spawn', 24, false);
				box.animation.addByIndices('normal', 'Spirit Textbox spawn', [11], "", 24);

				var face:FlxSprite = new FlxSprite(320, 170).loadGraphic(Paths.image('weeb/spiritFaceForward'));
				face.setGraphicSize(Std.int(face.width * 6));
				add(face);

			case 'placeholder':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('4k/dialogueBox-4k');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);

			case 'sus':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('4k/dialogueBox-4k');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
				
			case 'megalovania':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('4k/dialogueBox-4k');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
			
			case 'ballistix':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('4k/dialogueBox-4k');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);

			case 'caught':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('4k/dialogueBox-4k');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);

			case 'forkay':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('4k/dialogueBox-4k');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);

			case 'trolled':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('4k/dialogueBox-4k');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
		
		portraitLeft = new FlxSprite(-100, FlxG.height - 510);
		portraitLeft.frames = Paths.getSparrowAtlas('4k/portraits/trollface');
		portraitLeft.animation.addByPrefix('enter', 'Troll Portrait Enter', 24, false);
		portraitLeft.updateHitbox();
		portraitLeft.scrollFactor.set();
		add(portraitLeft);
		portraitLeft.visible = false;

		portraitRight = new FlxSprite(800, FlxG.height - 510);
		portraitRight.frames = Paths.getSparrowAtlas('4k/portraits/bfPortrait');
		portraitRight.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
		portraitRight.updateHitbox();
		portraitRight.scrollFactor.set();
		add(portraitRight);
		portraitRight.visible = false;

		portraitBurger = new FlxSprite(100, FlxG.height - 510);
		portraitBurger.frames = Paths.getSparrowAtlas('4k/portraits/burger');
		portraitBurger.animation.addByPrefix('enter', 'NINTENBURGER Portrait Enter', 24, false);
		portraitBurger.antialiasing = true;
		portraitBurger.updateHitbox();
		portraitBurger.scrollFactor.set();
		add(portraitBurger);
		portraitBurger.visible = false;

		portraitAnaBF = new FlxSprite(800, FlxG.height - 550);
		portraitAnaBF.frames = Paths.getSparrowAtlas('4k/portraits/AnaPortraitBF');
		portraitAnaBF.animation.addByPrefix('enter', 'ANA portrait enter', 24, false);
		portraitAnaBF.antialiasing = true;
		portraitAnaBF.updateHitbox();
		portraitAnaBF.scrollFactor.set();
		add(portraitAnaBF);
		portraitAnaBF.visible = false;

		portraitAna = new FlxSprite(100, FlxG.height - 550);
		portraitAna.frames = Paths.getSparrowAtlas('4k/portraits/AnaPortrait');
		portraitAna.animation.addByPrefix('enter', 'ANA Portrait Enter', 24, false);
		portraitAna.antialiasing = true;
		portraitAna.updateHitbox();
		portraitAna.scrollFactor.set();
		add(portraitAna);
		portraitAna.visible = false;

		portraitForgor = new FlxSprite(100, FlxG.height - 550);
		portraitForgor.frames = Paths.getSparrowAtlas('4k/portraits/dementio');
		portraitForgor.animation.addByPrefix('enter', 'Dementio Portrait Enter', 24, false);
		portraitForgor.antialiasing = true;
		portraitForgor.updateHitbox();
		portraitForgor.scrollFactor.set();
		add(portraitForgor);
		portraitForgor.visible = false;

		portraitSans = new FlxSprite(100, FlxG.height - 510);
		portraitSans.frames = Paths.getSparrowAtlas('4k/portraits/sans');
		portraitSans.animation.addByPrefix('enter', 'Sans Portrait Enter', 24, false);
		portraitSans.antialiasing = true;
		portraitSans.updateHitbox();
		portraitSans.scrollFactor.set();
		add(portraitSans);
		portraitSans.visible = false;
		
		box.animation.play('normalOpen');
		box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.9));
		box.updateHitbox();
		add(box);

		box.screenCenter(X);
		portraitLeft.screenCenter(X);

		handSelect = new FlxSprite(FlxG.width * 0.9, FlxG.height * 0.9).loadGraphic(Paths.image('weeb/pixelUI/hand_textbox'));
		add(handSelect);


		if (!talkingRight)
		{
			// box.flipX = true;
		}

		dropText = new FlxText(242, 502, Std.int(FlxG.width * 0.6), "", 32);
		dropText.font = 'Pixel Arial 11 Bold';
		dropText.color = 0xFFD89494;
		add(dropText);

		swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), "", 32);
		swagDialogue.font = 'Pixel Arial 11 Bold';
		swagDialogue.color = 0xFF3F2021;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		add(swagDialogue);

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		// HARD CODING CUZ IM STUPDI
		if (PlayState.SONG.song.toLowerCase() == 'roses')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'thorns')
		{
			portraitLeft.color = FlxColor.BLACK;
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}

		dropText.text = swagDialogue.text;

		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if (FlxG.keys.justPressed.ANY  && dialogueStarted == true)
		{
			remove(dialogue);
				
			FlxG.sound.play(Paths.sound('clickText'), 0.8);

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'thorns')
						FlxG.sound.music.fadeOut(2.2, 0);

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						box.alpha -= 1 / 5;
						bgFade.alpha -= 1 / 5 * 0.7;
						portraitLeft.visible = false;
						portraitRight.visible = false;
						swagDialogue.alpha -= 1 / 5;
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);

		switch (curCharacter)
		{
			case 'troll':
				portraitRight.visible = false;
				portraitBurger.visible = false;
				portraitAna.visible = false;
				portraitAnaBF.visible = false;
				portraitForgor.visible = false;
				portraitSans.visible = false;
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}
			case 'bf':
				portraitLeft.visible = false;
				portraitBurger.visible = false;
				portraitAna.visible = false;
				portraitAnaBF.visible = false;
				portraitForgor.visible = false;
				portraitSans.visible = false;
				if (!portraitRight.visible)
				{
					portraitRight.visible = true;
					portraitRight.animation.play('enter');
				}
			case 'burger':
				portraitLeft.visible = false;
				portraitRight.visible = false;
				portraitAna.visible = false;
				portraitAnaBF.visible = false;
				portraitForgor.visible = false;
				portraitSans.visible = false;
				if (!portraitBurger.visible)
				{
					portraitBurger.visible = true;
					portraitBurger.animation.play('enter');
				}
			case 'ana-bf':
				portraitLeft.visible = false;
				portraitRight.visible = false;
				portraitBurger.visible = false;
				portraitAna.visible = false;
				portraitAnaBF.visible = false;
				portraitSans.visible = false;
				if (!portraitAnaBF.visible)
				{
					portraitAnaBF.visible = true;
					portraitAnaBF.animation.play('enter');
				}
			case 'ana':
				portraitLeft.visible = false;
				portraitRight.visible = false;
				portraitBurger.visible = false;
				portraitAnaBF.visible = false;
				portraitAna.visible = false;
				portraitSans.visible = false;
				if (!portraitAna.visible)
				{
					portraitAna.visible = true;
					portraitAna.animation.play('enter');
				}
			case 'dementio':
				portraitLeft.visible = false;
				portraitRight.visible = false;
				portraitBurger.visible = false;
				portraitAnaBF.visible = false;
				portraitAna.visible = false;
				portraitSans.visible = false;
				if (!portraitForgor.visible)
				{
					portraitForgor.visible = true;
					portraitForgor.animation.play('enter');
				}
			case 'sans':
				portraitLeft.visible = false;
				portraitRight.visible = false;
				portraitBurger.visible = false;
				portraitAnaBF.visible = false;
				portraitAna.visible = false;
				portraitForgor.visible = false;
				if (!portraitSans.visible)
				{
					portraitSans.visible = true;
					portraitSans.animation.play('enter');
				}
		}
	}

	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}
}
