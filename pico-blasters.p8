pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
----------------------------
-- pico-blasters
-- built in vscode studio 
-- by gareth jackson
-- /Applications/pico-8/PICO-8.app/Contents/MacOS/pico8 for debugging from cli
-- printh("hello world")
----------------------------

#include src/debug.lua
#include src/map.lua
#include src/flames.lua
#include src/bombs.lua
#include src/player.lua
#include src/tools.lua
#include src/main.lua

__gfx__
0000000066666666333333333333333337767553d6d6d671176d6d6d511551155115511551155115d6d6d6d11d6d6d6dd77dd77d000000000000000000000000
0000000066666666333333b3333333337dddddd1d6d6d71dd57d6d6dd66dd66dd664166dd664166dd6d6d6d11d6d6d6d6dd66dd6000000000000000000000000
007007006666666633333bb33333333376dddd217d6d71d66d17d6d76dd66dd66dd44dd66dd44dd67d6d6d6556d6d6d7d66dd66d000000000000000000000000
00077000666666663b333b33333333336dd6ddd17d67566dd66176d7d66dd66dd662266dd662266d7d6d6d6556d6d6d76dd66dd6000000000000000000000000
00077000666666663bb33333333333337d6ddd11d6756dd66dd6576d6dd66dd66d99aad66d8a99d6d6d6d6d11d6d6d6dd66dd66d000000000000000000000000
007007006666666633b333333333333356d2d1d1d75dd66dd66dd57dd66dd66dd66aa66dd66aa66dd6d6d6d11d6d6d6d6dd66dd6000000000000000000000000
000000006666666633333333333333335d2d111171d66dd66dd66d176dd66dd66dda8dd66dd8add67d6d6d6556d6d6d7d66dd66d000000000000000000000000
0000000066666666333333333333333311111111d77dd77dd77dd77dd77dd77dd77d877dd778d77d7d6d6d6556d6d6d751155115000000000000000000000000
3699444300000000000000000000000000000000577dd77d77dd77d512525251d751157dd61111111111116d0000000000000000000000000000000000000000
7944445500000000000000000000000000000000d5d66dd6dd66d6571225269161222216d11222225922911d0000000000000000000000000000000000000000
4666d55400000000000000000000000000000000761dd66d66dd71d7122222211122521172229225262262270000000000000000000000000000000000000000
44444445000000000000000000000000000000007d716dd6dd671d6d129222211962222122522252522222220000000000000000000000000000000000000000
5445445500000000000000000000000000000000d6d7166d66716d6d122226911222292122222225252225220000000000000000000000000000000000000000
5544454100000000000000000000000000000000d6d675d6d756d6d71125221112222221d22622625229222d0000000000000000000000000000000000000000
22665111000000000000000000000000000000007d6d671671d6d6d7612222161962522171192295222221170000000000000000000000000000000000000000
32111113000000000000000000000000000000007d6d6d71166d6d6dd751157d1525252176111111111111670000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000d6d6d6d1d6d6d6d1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000d6d6d6d1d6d6d6d1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000007d6a6d657d696d65000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000088aa24157aa92415000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000daa9244188aa2441000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000d6d9d6d1d6dad6d1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000007d6d6d657d6d6d65000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000007d6d6d657d6d6d65000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3333339a331111a83497a9a334343434489a7a930000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33311a183176518a9a8a9a499898989839a7a9840000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
331751131761111579a779a7a9a9a9a9489a7a930000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3175115116511111aa8a7a8a7a7a7a7a39a7a9840000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
315111511511111579a7a7a7a7a7a7a7489a7a930000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
31111111111111159a979a999a9a9a9a39a7a9840000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
331111133111115374a989a489898989489a7a930000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33311133331115333a97a9434343434339a7a9840000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3376673333c77c3333c77c3300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
371aa173671aa173371aa17600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
671aa17667a55a7667a55a7600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
67a55a763ca99ac66ca99ac300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
37c99c73f1cddc1331cddc1f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f11aa11f3d1aa11ffd1aa11300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3e7cc7e3317cc7e33e7cc7e300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
31711713333117133171133300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0001000001010101010101010100000002000000000101010101010000000000000000000000000000000000000000000000010100000000000000000000000001011010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010100000000000000000000000000
__map__
0000000000000000000000000000000300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
150c080c0c080c180c080c0c080c160300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a030303030303030303030303030b0300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3203040304030403040304030403320300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a030303030303030303030303030b0300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a030403040304030403040304030b0300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3203030303030303030303030303320300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a030403040304030403040304030b0300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
19030303030303030303030303031a0300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a030403040304030403040304030b0300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3203030303030303030303030303320300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a030403040304030403040304030b0300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a030303030303030303030303030b0300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3203040304030403040304030403320300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a030303030303030303030303030b0300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0507080707080717070807070807060300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0303030303030303030303030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
