function onCreate()
if hideHud == false then
      precacheImage('HealthBar-Skins/healthBarAnimated');

      makeAnimatedLuaSprite('healthBarWithAnim', 'HealthBar-Skins/healthBarAnimated', 0, 0);
      addAnimationByPrefix('healthBarWithAnim', 'healthBarAnimated', 'Health Bar Animated', 24, false);
      objectPlayAnimation('healthBarWithAnim', 'healthBarAnimated');
      setObjectCamera('healthBarWithAnim', 'hud'); 
      addLuaSprite('healthBarWithAnim', true);
end
end

function onCreatePost()
      setProperty('healthBarWithAnim.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'));

      setProperty('healthBarWithAnim.x', getProperty('healthBar.x') - 4);
      setProperty('healthBarWithAnim.y', getProperty('healthBar.y') - 4);
      setObjectOrder('healthBarWithAnim', 4);
end

function onBeatHit()
if curBeat % 2 == 0 then
      objectPlayAnimation('healthBarWithAnim', 'healthBarAnimated', true);
   end
end

function onCountdownTick(counter)
if counter % 1 == 0 then
      objectPlayAnimation('healthBarWithAnim', 'healthBarAnimated');
   end
end