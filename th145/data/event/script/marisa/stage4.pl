#========================================================================
#	魔理沙ストーリー
#	ステージ4　VSマミゾウ
#	場所：異変の神社＊
#	ステージタイトル
#	   「独り言って恥ずかしいよね」
#
#========================================================================
:init
,SetDefaultBalloon,0,#メッセージに噴出し指定をつけない場合のデフォルト噴出しを設定

#フェイス画像参照の定義
,LoadImageDef,"data/event/pic/marisa.csv"
,LoadImageDef,"data/event/pic/mamizou.csv"

#フェイス画像
,DefineObject,marisa,-360,0,false
,DefineObject,mamizou,-360,0,true

,Return
# =========================================================

# 本編
# -------------------------------------------------------

# ********************************************
# ********************************************

:main_1

,GoSub,init				,# 初期化ルーチン呼び出し

#開始カメラ演出
,Function,GameStory_BeginCamera();
,Sleep,2,#ウェイト命令
,Function,"::act.fader.FadeIn(60, 0x00000000, null);"

,Function,"GameStory_PlayBGM(706);",# 会話BGM再生開始

#肩書き登録
,DefineObject,marisa_label,50,360,false
,DefineObject,mamizou_label,1120,360,false

#初期表情設定
,ImageDef,marisa,魔理沙_普1,0,0
,ImageDef,mamizou,マミゾウ_普1,0,0


#Xフレームの待機処理（sleepと異なりスキップ操作で飛ばせない）
,Function,"function main(){ for (local i=0; i < 60; i++) suspend(); }"

#タイトルコール出現
,Function,GameStory_TitleCall();
,Function,"function main(){ for (local i=0; i < 150; i++) suspend(); }"


,th145_Show,marisa,-1280	,,#魔理沙フェイス表示開始

,SetFocus,marisa		,
,ImageDef,marisa,魔理沙_決1,0,0
"Phew, finally a place where I can relax a bit.\",a15x3,0,0
,ClearBalloon,marisa

,SetFocus,marisa		,
,ImageDef,marisa,魔理沙_怒1,0,0
"I hope they'll let me.\",a11x2,0,0
,ClearBalloon,marisa

,SetFocus,marisa		,
,ImageDef,marisa,魔理沙_普2,0,0
"I just want to live in peace among the people.\",a15x3,0,0
,ClearBalloon,marisa

# 2Pキャラステージ下から登場
,Function,GameStory_2P_In_Side(),
,Function,"function main(){ for (local i=0; i < 60; i++) suspend(); }"


,th145_Show,mamizou,-1280	,,#魔理沙フェイス表示開始

,SetFocus,mamizou		,
,ImageDef,mamizou,マミゾウ_普1,0,0
"Well, what do we have here. A\npeace-seeking spirit.\",a15x3,0,0
,ClearBalloon,mamizou

#紹介カット表示　マミゾウは「マミゾウ_普1」からのみ実行可能\,a11x2,0,0
,th145_CharName_Cutin,mamizou
,Function,"function main(){ for (local i=0; i < 30; i++) suspend(); }"

,SetFocus,mamizou		,
,ImageDef,mamizou,マミゾウ_驚1,0,0
"I see you're looking\nfor a place to lodge.\",a15x3,0,0
,ClearBalloon,mamizou

,SetFocus,marisa		,
,ImageDef,marisa,魔理沙_怒1,0,0
"How do you know\nthat? Were you\nlistening to me?\",a15x3,0,0
,ClearBalloon,marisa

,SetFocus,mamizou		,
,ImageDef,mamizou,マミゾウ_汗1,0,0
"Actually, yes. That's why I'm here.\",a15x3,0,0
,ClearBalloon,mamizou

,SetFocus,mamizou		,
,ImageDef,mamizou,マミゾウ_嬉1,0,0
"I'll let you stay at our place\nonly under the following conditions.\",a15x3,0,0
,ClearBalloon,mamizou

,SetFocus,mamizou		,
,ImageDef,mamizou,マミゾウ_惑1,0,0
"First: You must defeat me.\",a15x3,0,0
,ClearBalloon,mamizou

,SetFocus,mamizou		,
,ImageDef,mamizou,マミゾウ_汗1,0,0
"Second: You must go to the outside world and\nbeat the person that caused all of this.\",a15x3,0,0
,ClearBalloon,mamizou

,SetFocus,marisa		,
,ImageDef,marisa,魔理沙_決1,0,0
"Deal. Defeating you would be easy.\",a15x3,0,0
,ClearBalloon,marisa

,SetFocus,mamizou		,
,ImageDef,mamizou,マミゾウ_嬉1,0,0
"Ok, let the battle begin.\",a15x3,0,0
,ClearBalloon,mamizou

#両者フェイス撤去
,th145_Hide,marisa,-1280,&
,th145_Hide,mamizou,-1280,

,Function,"StopBGM(500);",# BGM停止
,Function,"GameStory_PlayBattleBGM(512);",# 戦闘BGM再生開始

,Function,"RoundStory_Ready();",# TODO::対戦開始命令

,End

# -----------------
# 戦闘中に会話が入ります（スペルカード一つ使った後くらいかな）
#
:main_2

,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,marisa,魔理沙_決1,0,0
,ImageDef,mamizou,マミゾウ_怒1,0,0

,Sleep,5

#,Move,marisa,0,-25,25	,#フェイス画像位置を非トーク位置にシフト
,th145_Show,marisa,-1280,&,#魔理沙フェイス表示開始
,th145_Show,mamizou,-1280,#魔理沙フェイス表示開始


,SetFocus,marisa		,#発言中キャラを指定
"This is being easy.\",a11x2,0,0
,ClearBalloon,marisa

,SetFocus,mamizou		,
"That was just the beginning.\",a15x3,0,0
,ClearBalloon,mamizou


#両者フェイス撤去
,th145_Hide,marisa,-1280,&
,th145_Hide,mamizou,-1280,

,Sleep,60

,Function,"RoundStory_TalkFight();",# TODO::対再開命令

,End


# -------------------------------------------------------
# 敗北編
# -------------------------------------------------------
:lose
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,marisa,魔理沙_負1,0,0
,ImageDef,mamizou,マミゾウ_惑1,0,0

,th145_Show,marisa,-1280	,&,#魔理沙フェイス表示開始
,th145_Show,mamizou,-1280	,#魔理沙フェイス表示開始

,SetFocus,mamizou
"Come on, I know you can win against me.\",a15x3,0,0

,Function,"::StopBGM(1500);"
#コンテニュー処理へのジャンプを予定　現在は仮で次のステージに進んでから一つ戻る処理を行い、同ステージの最初から再開します
,Thread,"::story.BeginOpening();"#オープニング開始

,End




# -------------------------------------------------------
# 勝利
# -------------------------------------------------------
:win
,GoSub,init				,# 初期化ルーチン呼び出し

#初期表情設定
,ImageDef,marisa,魔理沙_驚1,0,0
,ImageDef,mamizou,マミゾウ_負1,0,0

,th145_Show,marisa,-1280	,&,#魔理沙フェイス表示開始
,th145_Show,mamizou,-1280	,#魔理沙フェイス表示開始


,SetFocus,marisa		,
"There, I won. Now tell me where is tha\nperson I must beat.\",a15x3,0,0
,ClearBalloon,marisa

,SetFocus,mamizou		,
"Go to the Hakurei Shrine and talk to Kasen. She'll help\nyou get to the Outside World.\",a15x3,0,0
,ClearBalloon,mamizou

,SetFocus,marisa		,
,ImageDef,marisa,魔理沙_怒1,0,0
"How does she look?\",a11x2,0,0
,ClearBalloon,marisa

,SetFocus,mamizou		,
,ImageDef,mamizou,マミゾウ_惑1,0,0
"She's a pink haired hermit. You'll\nrecognize her immediately.\",a15x3,0,0
,ClearBalloon,mamizou

,SetFocus,mamizou		,
,ImageDef,mamizou,マミゾウ_嬉1,0,0
"Good luck with the\nsecond condition.\",a15x3,0,0
,ClearBalloon,mamizou








,Function,"::StopBGM(1500);"
,Thread,"::story.NextStage();"

,End

# -------------------------------------------------------
# サブルーチン
# -------------------------------------------------------
:TestMessage
サブルーチン実行\
,ClearBalloon
,Return
