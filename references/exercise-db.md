# exercise-db.md — 種目データベース(メニュー生成の唯一ソース)

- 登録数: 78種目(自宅28 / ジム40 / 屋外10)
- 本DBにない種目は計画に採用しない(CLAUDE.md 絶対規則1)
- 推奨レップ帯の出典: ACSM Position Stand (2009)[^1]・Schoenfeld et al. (2017)[^2]。目的別の適用は `.claude/skills/monthly-plan/references/programming.md` §1 に従う
- 参考URL は **2026-07-12 に Web 検索・フェッチで実在確認済み**(確認日を各行に併記)。月次計画生成時に plan-researcher(または Web 検索)で再確認し、リンク切れ検知時は本DBを更新する。架空 URL の記載は絶対禁止(絶対規則2)
- ⚠️ 初期データは Claude が投入したもの。**運用開始前にユーザー監修で内容を確認すること**(設計書§15-3)

[^1]: American College of Sports Medicine, Progression Models in Resistance Training for Healthy Adults, Med Sci Sports Exerc, 2009
[^2]: Schoenfeld BJ et al., J Sports Sci, 2017(週あたり部位別ボリュームの用量反応)

## 自宅(28種目)

| 種目名 | 対象部位(主働/協働) | 場所 | 必要器具 | 難易度 | 種目説明 | 推奨レップ帯 | 参考URL |
|---|---|---|---|---|---|---|---|
| プッシュアップ | 大胸筋 / 三頭・前肩 | 自宅 | なし | 初級 | 腕立て伏せ。手は肩幅よりやや広く、体を一直線に保って胸を床に近づける | 筋肥大8-12・持久12-20[^1] | https://www.acefitness.org/resources/everyone/exercise-library/41/push-up/ (確認日: 2026-07-12) |
| ワイドプッシュアップ | 大胸筋外側 / 前肩 | 自宅 | なし | 初級 | 手幅を広げた腕立て伏せ。胸のストレッチを強調する | 8-15[^1] | https://www.muscleandstrength.com/exercises/wide-grip-push-ups.html (確認日: 2026-07-12) |
| デクラインプッシュアップ | 大胸筋上部 / 三頭・前肩 | 自宅 | なし(台) | 中級 | 足を台に乗せた腕立て伏せ。上部胸に負荷が移る | 8-12[^1] | https://exrx.net/WeightExercises/PectoralClavicular/BWDeclinePushup (確認日: 2026-07-12) |
| パイクプッシュアップ | 三角筋前・中 / 三頭 | 自宅 | なし | 中級 | 腰を高く上げた「く」の字姿勢で頭を斜め前に下ろす。肩の自重種目 | 8-12[^1] | https://exrx.net/WeightExercises/PectoralClavicular/BWPikePushup (確認日: 2026-07-12) |
| ダンベルフロアプレス | 大胸筋 / 三頭 | 自宅 | ダンベル | 初級 | 床に仰向けでダンベルを押し上げる。ベンチ不要のプレス種目 | 8-12[^1] | https://www.muscleandstrength.com/exercises/dumbbell-floor-press.html (確認日: 2026-07-12) |
| ダンベルショルダープレス | 三角筋前・中 / 三頭 | 自宅・ジム | ダンベル | 初級 | 座位または立位で肩の高さから頭上へ押し上げる | 8-12[^1] | https://exrx.net/WeightExercises/DeltoidAnterior/DBShoulderPress (確認日: 2026-07-12) |
| サイドレイズ | 三角筋中部 | 自宅・ジム | ダンベル | 初級 | 軽めのダンベルを体側から肩の高さまで横に上げる。肩幅づくりの定番 | 12-20[^1] | https://exrx.net/WeightExercises/DeltoidLateral/DBLateralRaise (確認日: 2026-07-12) |
| アーノルドプレス | 三角筋前・中 / 三頭 | 自宅・ジム | ダンベル | 中級 | 手のひらを内側に向けた位置から回旋させながら頭上へ押し上げる。プレスとレイズの動きを併せ持つ | 8-12[^1] | https://exrx.net/WeightExercises/DeltoidAnterior/DBArnoldPress (確認日: 2026-07-12) |
| ダンベルフロントレイズ | 三角筋前部 | 自宅・ジム | ダンベル | 初級 | 腕を伸ばしたまま体の前から肩の高さまで交互に上げる | 12-20[^1] | https://exrx.net/WeightExercises/DeltoidAnterior/DBAlternatingFrontRaise (確認日: 2026-07-12) |
| ダンベルアップライトロー | 三角筋中部 / 僧帽筋 | 自宅・ジム | ダンベル | 中級 | 肘を先行させてダンベルを体に沿って胸の高さまで引き上げる。肩に違和感が出たら中止する | 10-15[^1] | https://exrx.net/WeightExercises/DeltoidLateral/DBUprightRow (確認日: 2026-07-12) |
| ダンベルカール | 上腕二頭筋 | 自宅・ジム | ダンベル | 初級 | 肘を固定して前腕を巻き上げる。反動を使わない | 8-15[^1] | https://exrx.net/WeightExercises/Biceps/DBCurl (確認日: 2026-07-12) |
| ハンマーカール | 上腕二頭・腕橈骨筋 | 自宅・ジム | ダンベル | 初級 | 手のひらを内側に向けたままのカール。前腕も鍛える | 8-15[^1] | https://exrx.net/WeightExercises/Brachioradialis/DBHammerCurl (確認日: 2026-07-12) |
| コンセントレーションカール | 上腕二頭筋 | 自宅・ジム | ダンベル | 初級 | 座って肘を内腿に固定し、片腕ずつ巻き上げる。反動が使えず二頭筋に集中できる | 8-15[^1] | https://exrx.net/WeightExercises/Brachialis/DBConcentrationCurl (確認日: 2026-07-12) |
| ダンベルキックバック | 上腕三頭筋 | 自宅・ジム | ダンベル | 初級 | 前傾して上腕を床と平行に固定し、肘から先を後方へ伸ばし切る | 10-15[^1] | https://exrx.net/WeightExercises/Triceps/DBKickback (確認日: 2026-07-12) |
| ダンベルリストカール | 前腕屈筋群 | 自宅・ジム | ダンベル | 初級 | 前腕を腿や台に乗せ、手のひらを上にして手首の曲げ伸ばしでダンベルを上下させる | 12-20[^1] | https://exrx.net/WeightExercises/WristFlexors/DBWristCurl (確認日: 2026-07-12) |
| ダンベルリバースリストカール | 前腕伸筋群 | 自宅・ジム | ダンベル | 初級 | 手の甲を上にして前腕を固定し、手首を反らせるようにダンベルを持ち上げる | 12-20[^1] | https://exrx.net/WeightExercises/WristExtensors/DBReverseWristCurl (確認日: 2026-07-12) |
| ワンハンドローイング | 広背筋 / 二頭・僧帽 | 自宅・ジム | ダンベル | 初級 | 片手・片膝を台に置き、ダンベルを脇腹へ引き上げる | 8-12[^1] | https://exrx.net/WeightExercises/BackGeneral/DBBentOverRow (確認日: 2026-07-12) |
| インバーテッドロー(斜め懸垂) | 広背筋・僧帽中部 / 二頭 | 自宅・屋外 | 低い鉄棒・頑丈な台 | 初級 | 低いバーの下に仰向けにぶら下がり、体を一直線に保って胸をバーへ引き上げる。懸垂の導入に最適 | 8-15(自重)[^1] | https://exrx.net/WeightExercises/BackGeneral/BWSupineRow (確認日: 2026-07-12) |
| ダンベルデッドリフト | ハムストリング・臀部 / 脊柱起立筋 | 自宅・ジム | ダンベル | 中級 | 背中をまっすぐ保ち、股関節を折ってダンベルを下ろし立ち上がる | 8-12[^1] | https://www.muscleandstrength.com/exercises/dumbbell-deadlift.html (確認日: 2026-07-12) |
| ゴブレットスクワット | 大腿四頭筋・臀部 / 体幹 | 自宅・ジム | ダンベル | 初級 | ダンベルを胸の前で抱えてしゃがむ。フォーム習得に最適 | 8-15[^1] | https://www.acefitness.org/resources/everyone/exercise-library/362/goblet-squat/ (確認日: 2026-07-12) |
| 自重スクワット | 大腿四頭筋・臀部 | 自宅 | なし | 初級 | 足を肩幅に開き、椅子に座るように腰を下ろして立ち上がる | 15-20[^1] | https://www.acefitness.org/resources/everyone/exercise-library/135/bodyweight-squat/ (確認日: 2026-07-12) |
| ブルガリアンスクワット | 大腿四頭筋・臀部(片脚) | 自宅・ジム | なし(台)・ダンベル可 | 中級 | 後ろ足を台に乗せた片脚スクワット。強度が高い | 8-12[^1] | https://exrx.net/WeightExercises/Quadriceps/BWSingleLegSplitSquat (確認日: 2026-07-12) |
| フォワードランジ | 大腿四頭筋・臀部 / ハム | 自宅・屋外 | なし・ダンベル可 | 初級 | 大きく一歩踏み出して膝を落とし、蹴り戻る | 10-15[^1] | https://www.acefitness.org/resources/everyone/exercise-library/94/forward-lunge/ (確認日: 2026-07-12) |
| ヒップスラスト(自重) | 大臀筋 / ハム | 自宅 | なし(台) | 初級 | 肩甲骨を台に預け、腰を持ち上げてお尻を締める | 12-20[^1] | https://www.acefitness.org/resources/everyone/exercise-library/49/glute-bridge/ (確認日: 2026-07-12) |
| カーフレイズ | 下腿三頭筋 | 自宅・ジム | なし・ダンベル可 | 初級 | つま先立ちを繰り返す。段差を使うと可動域が広がる | 15-20[^1] | https://www.acefitness.org/resources/everyone/exercise-library/51/calf-raises/ (確認日: 2026-07-12) |
| プランク | 腹横筋・体幹全般 | 自宅 | なし | 初級 | 前腕とつま先で体を一直線に支えて静止する | 30〜60秒×2-3セット[^1] | https://www.acefitness.org/resources/everyone/exercise-library/32/front-plank/ (確認日: 2026-07-12) |
| クランチ | 腹直筋上部 | 自宅 | なし | 初級 | 仰向けで膝を立て、みぞおちを支点に上体を丸める | 12-20[^1] | https://www.acefitness.org/resources/everyone/exercise-library/52/crunch/ (確認日: 2026-07-12) |
| レッグレイズ | 腹直筋下部 / 腸腰筋 | 自宅 | なし | 初級 | 仰向けで脚をそろえて上げ下ろしする。腰を反らせない | 12-20[^1] | https://exrx.net/WeightExercises/HipFlexors/BWLyingLegRaiseFloor (確認日: 2026-07-12) |

## ジム(40種目)

| 種目名 | 対象部位(主働/協働) | 場所 | 必要器具 | 難易度 | 種目説明 | 推奨レップ帯 | 参考URL |
|---|---|---|---|---|---|---|---|
| バーベルベンチプレス | 大胸筋 / 三頭・前肩 | ジム | バーベル・ベンチ | 中級 | ベンチに仰向けでバーを胸まで下ろし押し上げる。プレス系の基本 | 筋力1-6・筋肥大6-12[^1] | https://exrx.net/WeightExercises/PectoralSternal/BBBenchPress (確認日: 2026-07-12) |
| インクラインベンチプレス | 大胸筋上部 / 前肩・三頭 | ジム | バーベルまたはダンベル | 中級 | 30〜45度に傾けたベンチで行うプレス。上部胸を狙う | 6-12[^1] | https://exrx.net/WeightExercises/PectoralClavicular/BBInclineBenchPress (確認日: 2026-07-12) |
| ダンベルベンチプレス | 大胸筋 / 三頭・前肩 | ジム | ダンベル・ベンチ | 初級 | ダンベルで行うベンチプレス。可動域が広く左右差の矯正にも有効 | 8-12[^1] | https://exrx.net/WeightExercises/PectoralSternal/DBBenchPress (確認日: 2026-07-12) |
| ダンベルフライ | 大胸筋(ストレッチ) | ジム | ダンベル・ベンチ | 中級 | 腕を弧を描くように開閉し、胸のストレッチを重視する | 10-15[^1] | https://exrx.net/WeightExercises/PectoralSternal/DBFly (確認日: 2026-07-12) |
| インクラインダンベルプレス | 大胸筋上部 / 前肩・三頭 | ジム | ダンベル・インクラインベンチ | 初級 | 傾けたベンチでダンベルを押し上げる。バーベルより可動域が広く上部胸を狙える | 8-12[^1] | https://exrx.net/WeightExercises/PectoralClavicular/DBInclineBenchPress (確認日: 2026-07-12) |
| インクラインダンベルフライ | 大胸筋上部(ストレッチ) | ジム | ダンベル・インクラインベンチ | 中級 | 傾けたベンチで腕を弧を描くように開閉し、上部胸のストレッチを重視する | 10-15[^1] | https://exrx.net/WeightExercises/PectoralClavicular/DBInclineFly (確認日: 2026-07-12) |
| デクラインダンベルプレス | 大胸筋下部 / 三頭 | ジム | ダンベル・デクラインベンチ | 中級 | 脚側を下げたベンチでダンベルを押し上げ、下部胸に負荷を集中させる | 8-12[^1] | https://exrx.net/WeightExercises/PectoralSternal/DBDeclineBenchPress (確認日: 2026-07-12) |
| ペックデックフライ(マシン) | 大胸筋 | ジム | マシン | 初級 | 背中をパッドにつけたまま腕のパッドを胸の前で閉じる。軌道固定でフライの導入に最適 | 10-15[^1] | https://exrx.net/WeightExercises/PectoralSternal/LVPecDeckFly (確認日: 2026-07-12) |
| ケーブルクロスオーバー | 大胸筋内側 | ジム | ケーブルマシン | 中級 | ケーブルを体の前でクロスさせるように閉じる。収縮を重視 | 12-15[^1] | https://exrx.net/WeightExercises/PectoralSternal/CBStandingFly (確認日: 2026-07-12) |
| チェストプレス(マシン) | 大胸筋 / 三頭 | ジム | マシン | 初級 | 軌道が固定されたプレスマシン。初心者のプレス導入に最適 | 8-15[^1] | https://exrx.net/WeightExercises/PectoralSternal/LVChestPress (確認日: 2026-07-12) |
| ディップス | 大胸筋下部・三頭 | ジム・屋外 | ディップスバー | 中級 | 平行棒で体を支え、肘を曲げて沈み込み押し上げる | 8-12(自重)[^1] | https://exrx.net/WeightExercises/PectoralSternal/BWChestDip (確認日: 2026-07-12) |
| バーベルスクワット | 大腿四頭筋・臀部 / 体幹 | ジム | バーベル・ラック | 中級 | バーを担いでしゃがみ立ち上がる。下半身種目の王様 | 筋力1-6・筋肥大6-12[^1] | https://exrx.net/WeightExercises/Quadriceps/BBSquat (確認日: 2026-07-12) |
| レッグプレス | 大腿四頭筋・臀部 | ジム | マシン | 初級 | シートに座り足でプレートを押す。腰への負担が少ない | 8-15[^1] | https://exrx.net/WeightExercises/Quadriceps/SL45LegPress (確認日: 2026-07-12) |
| レッグエクステンション | 大腿四頭筋 | ジム | マシン | 初級 | 座位で膝を伸ばす単関節種目。四頭筋を集中的に鍛える | 12-15[^1] | https://exrx.net/WeightExercises/Quadriceps/LVLegExtension (確認日: 2026-07-12) |
| レッグカール | ハムストリング | ジム | マシン | 初級 | うつ伏せまたは座位で膝を曲げる。ハム集中種目 | 10-15[^1] | https://exrx.net/WeightExercises/Hamstrings/LVLyingLegCurl (確認日: 2026-07-12) |
| ルーマニアンデッドリフト | ハムストリング・臀部 / 脊柱起立筋 | ジム | バーベルまたはダンベル | 中級 | 膝を軽く曲げたまま股関節を折り、バーを膝下まで下ろす | 8-12[^1] | https://exrx.net/WeightExercises/OlympicLifts/RomanianDeadlift (確認日: 2026-07-12) |
| デッドリフト | 脊柱起立筋・臀部・ハム / 広背・僧帽 | ジム | バーベル | 上級 | 床のバーを全身で引き上げる。フォーム習得を最優先する | 筋力1-6[^1] | https://exrx.net/WeightExercises/GluteusMaximus/BBDeadlift (確認日: 2026-07-12) |
| バックエクステンション | 脊柱起立筋 / 臀部・ハム | ジム | 45度ハイパーバック台 | 初級 | 45度の台に腿を固定し、腰を支点に上体を下ろして水平まで引き上げる | 12-20[^1] | https://exrx.net/WeightExercises/ErectorSpinae/BW45HyperextensionNeck (確認日: 2026-07-12) |
| ヒップスラスト(バーベル) | 大臀筋 / ハム | ジム | バーベル・ベンチ | 中級 | 肩甲骨をベンチに預け、腰にバーを乗せて突き上げる | 8-12[^1] | https://exrx.net/WeightExercises/GluteusMaximus/BBHipThrust (確認日: 2026-07-12) |
| ラットプルダウン | 広背筋 / 二頭 | ジム | マシン | 初級 | バーを胸の上部へ引き下ろす。懸垂の導入種目 | 8-12[^1] | https://exrx.net/WeightExercises/LatissimusDorsi/CBFrontPulldown (確認日: 2026-07-12) |
| ストレートアームプルダウン | 広背筋 | ジム | ケーブルマシン | 中級 | 肘を伸ばしたままバーを腿まで引き下ろす。二頭を介さず広背筋を単独で刺激する(ExRx名: Cable Bent-over Pullover) | 10-15[^1] | https://exrx.net/WeightExercises/LatissimusDorsi/CBBentoverPullover (確認日: 2026-07-12) |
| チンニング(懸垂) | 広背筋 / 二頭・僧帽 | ジム・屋外 | 懸垂バー | 中級 | バーにぶら下がり、胸をバーに近づけるように引き上げる | 6-12(自重)[^1] | https://exrx.net/WeightExercises/LatissimusDorsi/BWPullup (確認日: 2026-07-12) |
| シーテッドロー | 広背筋・僧帽中部 / 二頭 | ジム | ケーブルマシン | 初級 | 座位でハンドルを腹へ引く。肩甲骨を寄せ切る | 8-12[^1] | https://exrx.net/WeightExercises/BackGeneral/CBSeatedRow (確認日: 2026-07-12) |
| ベントオーバーロー | 広背筋・僧帽 / 二頭・起立筋 | ジム | バーベル | 中級 | 前傾姿勢でバーを腹へ引き上げる。背中の厚みをつくる | 6-12[^1] | https://exrx.net/WeightExercises/BackGeneral/BBBentOverRow (確認日: 2026-07-12) |
| Tバーロー | 広背筋・僧帽中部 | ジム | Tバーまたはランドマイン | 中級 | バーの一端を支点に斜めに引くロー。高重量を扱いやすい | 8-12[^1] | https://exrx.net/WeightExercises/BackGeneral/LVTBarRow (確認日: 2026-07-12) |
| シュラッグ | 僧帽筋上部 | ジム | バーベルまたはダンベル | 初級 | 肩をすくめるように真上に引き上げる | 10-15[^1] | https://exrx.net/WeightExercises/TrapeziusUpper/BBShrug (確認日: 2026-07-12) |
| バーベルショルダープレス | 三角筋前・中 / 三頭 | ジム | バーベル | 中級 | 立位または座位でバーを頭上へ押し上げる(OHP) | 6-12[^1] | https://exrx.net/WeightExercises/DeltoidAnterior/BBMilitaryPress (確認日: 2026-07-12) |
| マシンショルダープレス | 三角筋 / 三頭 | ジム | マシン | 初級 | 軌道固定の肩プレス。初心者の肩種目導入に最適 | 8-15[^1] | https://exrx.net/WeightExercises/DeltoidAnterior/LVShoulderPress (確認日: 2026-07-12) |
| ケーブルサイドレイズ | 三角筋中部 | ジム | ケーブルマシン | 中級 | ケーブルで行うサイドレイズ。全可動域で張力が抜けない | 12-20[^1] | https://exrx.net/WeightExercises/DeltoidLateral/CBLateralRaise (確認日: 2026-07-12) |
| リアデルトフライ | 三角筋後部 | ジム | マシンまたはダンベル | 初級 | 腕を後方へ開き肩の後ろ側を鍛える。姿勢改善にも有効 | 12-20[^1] | https://exrx.net/WeightExercises/DeltoidPosterior/DBRearLateralRaise (確認日: 2026-07-12) |
| フェイスプル | 三角筋後部・僧帽 / 回旋筋腱板 | ジム | ケーブルマシン | 初級 | ロープを顔へ向かって引き、肘を高く開く。肩の健康維持に有効 | 12-20[^1] | https://exrx.net/WeightExercises/DeltoidPosterior/CBStandingRearDeltRowRope (確認日: 2026-07-12) |
| バーベルカール | 上腕二頭筋 | ジム | バーベル | 初級 | バーベルで行うカール。反動を使わず肘を固定する | 8-12[^1] | https://exrx.net/WeightExercises/Biceps/BBCurl (確認日: 2026-07-12) |
| インクラインダンベルカール | 上腕二頭筋(長頭ストレッチ) | ジム | ダンベル・ベンチ | 中級 | 傾けたベンチに座り、腕を後方に垂らした状態からカールする | 8-12[^1] | https://exrx.net/WeightExercises/Biceps/DBInclineCurl (確認日: 2026-07-12) |
| バーベルプリーチャーカール | 上腕二頭筋・上腕筋 | ジム | バーベル・プリーチャー台 | 中級 | プリーチャー台に上腕を固定してバーを巻き上げる。チーティングを排除し可動域下部を強く刺激する | 8-12[^1] | https://exrx.net/WeightExercises/Brachialis/BBPreacherCurl (確認日: 2026-07-12) |
| ケーブルプレスダウン | 上腕三頭筋 | ジム | ケーブルマシン | 初級 | ケーブルを肘を固定して押し下げる。三頭の定番 | 10-15[^1] | https://exrx.net/WeightExercises/Triceps/CBPushdown (確認日: 2026-07-12) |
| スカルクラッシャー | 上腕三頭筋(長頭) | ジム | EZバーまたはダンベル | 中級 | 仰向けで額の上へバーを下ろし肘の開閉で押し上げる | 8-12[^1] | https://exrx.net/WeightExercises/Triceps/BBLyingTriExtSC (確認日: 2026-07-12) |
| ケーブルフレンチプレス | 上腕三頭筋(長頭) | ジム | ケーブルマシン | 中級 | ロープを頭の後ろに構え、肘の曲げ伸ばしで頭上へ押し上げる。全可動域で三頭筋長頭に張力がかかり続ける | 10-15[^1] | https://exrx.net/WeightExercises/Triceps/CBStandingTricepsExtensionRope (確認日: 2026-07-12) |
| ナローグリップベンチプレス | 上腕三頭筋 / 大胸筋内側・前肩 | ジム | バーベル・ベンチ | 中級 | 肩幅程度の狭い手幅で行うベンチプレス。三頭筋に高重量を扱える複合種目 | 6-12[^1] | https://exrx.net/WeightExercises/Triceps/BBCloseGripBenchPress (確認日: 2026-07-12) |
| バーベルリバースカール | 腕橈骨筋・前腕伸筋群 / 上腕二頭筋 | ジム | バーベル | 初級 | 手の甲を上(オーバーハンド)に握って巻き上げるカール。前腕と肘周りを太くする | 10-15[^1] | https://exrx.net/WeightExercises/Brachioradialis/BBReverseCurl (確認日: 2026-07-12) |
| ケーブルクランチ | 腹直筋 | ジム | ケーブルマシン | 初級 | 膝立ちでロープを持ち、腹を丸めて引き下ろす。腹筋に漸進的負荷をかけられる | 10-15[^1] | https://exrx.net/WeightExercises/RectusAbdominis/CBKneelingCrunch (確認日: 2026-07-12) |

## 屋外(10種目)

| 種目名 | 対象部位(主働/協働) | 場所 | 必要器具 | 難易度 | 種目説明 | 推奨レップ帯 | 参考URL |
|---|---|---|---|---|---|---|---|
| ウォーキング | 全身(有酸素・低強度) | 屋外 | なし | 初級 | 速歩。会話できる強度で継続する | 中強度 週150分以上[^3] | https://www.nhs.uk/live-well/exercise/walking-for-health/ (確認日: 2026-07-12) |
| ランニング | 全身(有酸素) | 屋外 | なし | 初級 | 一定ペースで走る。距離・時間・平均ペースを記録する | 20〜60分/回[^3] | https://www.nhs.uk/live-well/exercise/get-running-with-couch-to-5k/ (確認日: 2026-07-12) |
| インターバルスプリント | 全身(有酸素・高強度) | 屋外 | なし | 上級 | 疾走と休息を交互に繰り返す(例: 30秒疾走+90秒歩行×6〜8本) | 高強度 週75分相当[^3] | https://www.acefitness.org/education-and-resources/lifestyle/blog/6752/high-intensity-interval-training/ (確認日: 2026-07-12) |
| ヒルスプリント | 下半身・全身(高強度) | 屋外 | なし(坂) | 上級 | 上り坂を全力で駆け上がり歩いて戻る。平地より膝への衝撃が少ない | 10〜20秒×5〜8本[^3] | https://marathonhandbook.com/hill-sprints/ (確認日: 2026-07-12) |
| サイクリング | 下半身(有酸素) | 屋外 | 自転車 | 初級 | 一定ケイデンスで漕ぐ。膝への衝撃が少ない有酸素 | 中強度 週150分以上[^3] | https://www.nhs.uk/live-well/exercise/cycling-for-beginners/ (確認日: 2026-07-12) |
| 縄跳び | 全身(有酸素)・下腿 | 屋外・自宅 | 縄 | 初級 | 両足跳びを一定リズムで続ける。短時間で心拍が上がる | 1〜3分×3〜5セット[^3] | https://www.acefitness.org/resources/everyone/blog/5408/calorie-burning-jump-rope-workout/ (確認日: 2026-07-12) |
| 階段昇降 | 下半身(有酸素) | 屋外 | なし(階段) | 初級 | 階段を一定ペースで昇り降りする。臀部・四頭に効く有酸素 | 10〜20分[^3] | https://www.chp.gov.hk/en/static/90006.html (確認日: 2026-07-12) |
| 懸垂(公園鉄棒) | 広背筋 / 二頭 | 屋外 | 鉄棒 | 中級 | 公園の鉄棒で行うチンニング。回数を記録する | 6-12(自重)[^1] | https://exrx.net/WeightExercises/LatissimusDorsi/BWPullup (確認日: 2026-07-12) |
| パラレルバーディップス | 大胸筋下部・三頭 | 屋外 | 平行棒 | 中級 | 公園の平行棒で行うディップス | 8-12(自重)[^1] | https://exrx.net/WeightExercises/PectoralSternal/BWChestDip (確認日: 2026-07-12) |
| ベンチステップアップ | 大腿四頭筋・臀部 | 屋外 | なし(ベンチ・段) | 初級 | 公園のベンチ等へ片脚で踏み上がる。左右交互に行う | 10-15/脚[^1] | https://www.acefitness.org/resources/everyone/exercise-library/28/step-up/ (確認日: 2026-07-12) |

[^3]: WHO Guidelines on Physical Activity and Sedentary Behaviour (2020)

## ユーザー登録種目(DB追随更新)

ユーザーが実績として記録した DB 外種目を、daily-log スキル「DB外の種目・食材を検出した場合」の手順(表記ゆれ判定→ユーザー確認)を経てここへ追記する。列構成は上表と同一+登録日・登録元。計画生成では上の初期登録種目と同格に扱う。

| 種目名 | 対象部位(主働/協働) | 場所 | 必要器具 | 難易度 | 種目説明 | 推奨レップ帯 | 参考URL | 登録日 | 登録元 |
|---|---|---|---|---|---|---|---|---|---|

## DB 更新規則

- 種目の追加・変更はユーザー承認のもとで行い、コミットメッセージは `db: update exercise-db` とする
- 参考URL を登録する際は必ず `| https://…(確認日: YYYY-MM-DD) |` の形式で確認日を併記する
- リンク切れを検知したら「未登録」に戻すか、確認済みの代替 URL に差し替える
- 実績由来の追加(DB追随更新)は「ユーザー登録種目」表へ行い、コミットメッセージは `db: add <種目名> (user-logged)` とする。表記ゆれによる重複登録を検知したら統合し、exercise-log の種目名も正式名称へ揃える
