# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Type.create(name: 'オーケストラ')
Type.create(name: '吹奏楽')
Type.create(name: 'アンサンブル')
Type.create(name: '合唱')
Type.create(name: '大編成')
Type.create(name: 'サブカル系')
Type.create(name: '音大生多数')
Type.create(name: 'プロ多数')

Region.create(name: '東京都内', sort_number: 1)
Region.create(name: '関東甲信越', sort_number: 2)
Region.create(name: '北海道・東北', sort_number: 3)
Region.create(name: '中部', sort_number: 4)
Region.create(name: '近畿・中国・四国', sort_number: 5)
Region.create(name: '九州', sort_number: 6)

InstrumentCategory.create(name: '木管楽器')
InstrumentCategory.create(name: '金管楽器')
InstrumentCategory.create(name: '弦楽器')
InstrumentCategory.create(name: '打楽器')
InstrumentCategory.create(name: '合唱')
InstrumentCategory.create(name: 'その他')

Instrument.create(name: 'フルート', sort_number: 111, short_name: 'Fl', instrument_category_id: 1)
Instrument.create(name: 'オーボエ', sort_number: 121, short_name: 'Ob', instrument_category_id: 1)
Instrument.create(name: 'クラリネット', sort_number: 131, short_name: 'Cl', instrument_category_id: 1)
Instrument.create(name: 'ファゴット', sort_number: 141, short_name: 'Fg', instrument_category_id: 1)
Instrument.create(name: 'ソプラノサックス', sort_number: 151, short_name: 'S.Sax', instrument_category_id: 1)
Instrument.create(name: 'アルトサックス', sort_number: 152, short_name: 'A.Sax', instrument_category_id: 1)
Instrument.create(name: 'テナーサックス', sort_number: 153, short_name: 'T.Sax', instrument_category_id: 1)
Instrument.create(name: 'バリトンサックス', sort_number: 154, short_name: 'B.Sax', instrument_category_id: 1)
Instrument.create(name: 'ホルン', sort_number: 211, short_name: 'Hr', instrument_category_id: 2)
Instrument.create(name: 'トランペット', sort_number: 221, short_name: 'Tp', instrument_category_id: 2)
Instrument.create(name: 'トロンボーン', sort_number: 231, short_name: 'Tb', instrument_category_id: 2)
Instrument.create(name: 'ユーフォニアム', sort_number: 232, short_name: 'Euph', instrument_category_id: 2)
Instrument.create(name: 'チューバ', sort_number: 241, short_name: 'Tu', instrument_category_id: 2)
Instrument.create(name: 'ヴァイオリン', sort_number: 311, short_name: 'Vn', instrument_category_id: 3)
Instrument.create(name: '1stヴァイオリン', sort_number: 312, short_name: '1stVn', instrument_category_id: 3)
Instrument.create(name: '2stヴァイオリン', sort_number: 313, short_name: '2ndVn', instrument_category_id: 3)
Instrument.create(name: 'ヴィオラ', sort_number: 321, short_name: 'Va', instrument_category_id: 3)
Instrument.create(name: 'チェロ', sort_number: 331, short_name: 'Vc', instrument_category_id: 3)
Instrument.create(name: 'コントラバス', sort_number: 341, short_name: 'Cb', instrument_category_id: 3)
Instrument.create(name: 'パーカッション', sort_number: 411, short_name: 'Perc', instrument_category_id: 4)

Hole.create(name: '東京芸術劇場', address:'東京都豊島区西池袋1-8-1', url: 'http://www.geigeki.jp/', region_id: 1)

Conductor.create(name: '小林研一郎', description: '炎のコバケン', url: 'http://www.it-japan.co.jp/kobaken/index2.htm')

Country.create(name: 'ドイツ', description: 'バッハ、ベートーヴェン、ブラームスとか')

Composer.create(last_name: 'ブラームス', full_name: 'ヨハネス・ブラームス', description: 'ドイツ三大Bのうちの一人', countries: [Country.find_by(name: 'ドイツ')])

Tune.create(title: '交響曲第1番 ハ短調 op.68', description: 'ブラームスの初めての交響曲', composer: Composer.find_by(last_name: 'ブラームス'))

Solist.create(name: '北村源三', url: 'https://ja.wikipedia.org/wiki/%E5%8C%97%E6%9D%91%E6%BA%90%E4%B8%89', description: '元NHK交響楽団首席トランペット奏者', instrument: Instrument.find_by(name: 'トランペット'))
