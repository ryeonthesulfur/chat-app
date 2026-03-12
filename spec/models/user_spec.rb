require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザーの新規登録' do
    context '新規登録できる場合' do
      it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = '1' * 129
        @user.password_confirmation = '1' * 129
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")

      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '654321'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.save
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testexample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
    end
  end
end










=begin

提示されたコードは、**RSpecが自動生成した「Userモデル用テストのひな形（テンプレート）」**です。 まだ具体的なテスト内容は書かれておらず、「ここにUserモデルのテストを書いてくださいね」というプレースホルダー（場所取り）の状態です。

各行の意味は以下の通りです。

コードの解説
1.require 'rails_helper'

・RailsでRSpecを使うための設定ファイル（spec/rails_helper.rb）を読み込んでいます。

・これにより、テスト内でRailsの機能（モデルやデータベースなど）が使えるようになります。
RSpec.describe User, type: :model do ... end


2.RSpec.describe User, type: :model do

・ RSpec.describe User: 「これから Userクラス についてのテストを書きます」という宣言です。

・type: :model: これが「モデルのテスト」であることを指定しています。
  

【詳細解説】
・RSpec.describeは、RSpecが提供するメソッドで、テストの対象を定義します。
・Userは、テスト対象のクラス（モデル）を指定しています。
・type: :modelは、このテストが「モデルのテスト」であることをRSpecに伝えるためのオプションです。
　これにより、RSpecはモデル特有の機能やマッチャーを利用できるようになります。



3.pending "add some examples to (or delete) #{__FILE__}"
・pending: 「このテストはまだ未完成（保留中）です」とRSpecに伝えるメソッドです。
・この状態で bundle exec rspec を実行すると、テストは失敗（赤色）にはならず、保留（黄色）として扱われます。
・"add some examples...": 「このファイルにテスト例を追加するか、削除してください」というメッセージです。


【まとめ】
・pendingは、RSpecが提供するメソッドで、このテストがまだ未完成（保留中）であることを示します。
・この行があることで、bundle exec rspec を実行した際に、このテストは失敗（赤色）にはならず、保留（黄色）として扱われます。
・"add some examples to (or delete) #{__FILE__}"は、RSpecからのメッセージで、「このファイルにテスト例を追加するか、削除してください」という意味です。#{__FILE__}は、このコードが書かれているファイル名を動的に表示するためのRubyの構文です。

まとめると、このコードは「Userモデルについてのテストを書いてください」という指示が書かれたテンプレートであり、まだ具体的なテスト内容は記述されていない状態です。

=end




=begin

＊＊describeとは＊＊
describeとは、テストコードのグループ分けを行うメソッドです。
「どの機能に対してのテストを行うか」をdescribeでグループ分けし、
その中に各テストコードを記述します。

describeにつづくdo~endの間に、さらにdescribeメソッドを記述することで、
入れ子構造をとることもできます。


＊＊itとは＊＊
itとは、実際のテストコードを記述するためのメソッドです。
itの場合はより詳細に、「describeメソッドに記述した機能において、どのような状況のテストを行うか」を明記します。

「何をテストするのか」をitで定義し、その中にテストコードを記述します。

**examplesとは**
exampleとは、itで分けたグループのことを指します。
また、itに記述した内容のことを指す場合もあります。

RSpecでは、テストコードのことを「examples（例）」と呼びます。
describeやitで定義されたテストコードは、RSpecの実行時に「examples」として認識され、実行されます。

=end






=begin

＊＊bundle execコマンドとは＊＊
bundle execコマンドは、Bundlerが管理するGemfileに記載されたgemを使用して、
Gemfile.lockに記載されたバージョンのgemを使用して、指定したコマンドを実行するためのコマンドです。

bundle execコマンドを使用することで、プロジェクトごとに異なるバージョンのgemを使用することができます。
これにより、プロジェクトの依存関係を管理しやすくなります。
例えば、bundle exec rspecコマンドを使用することで、RSpecのテストコードを実行することができます。
このコマンドは、GemfileにRSpecが記載されている場合に、RSpecのバージョンをGemfile.lockから読み取り、そのバージョンのRSpecを使用してテストコードを実行します。




＊＊エクスペクテーションとは＊＊
エクスペクテーションとは、検証で得られた挙動が想定通りなのかを確認する構文のことです。
expect().to matcher()を雛形に、テストの内容に応じて引数やmatcherを変えて記述します。



＊＊「Railsの機能（valid?）」と「RSpecの機能（expect）」の役割分担を整理すると、霧が晴れるように分かるはずです。＊＊

1. valid? は「警察官」（Railsの機能）
まず、valid? はテスト用の機能ではありません。アプリそのものの機能（Railsの機能）です。

役割: データをチェックして、ルール違反があれば「違反切符（エラーメッセージ）」を切る。
挙動:
ルール違反あり ➔ false を返す。そして、user.errors というポケットに「違反切符（エラーメッセージ）」をこっそり入れる。
重要: valid? は**「違反切符を切る」だけで、それを誰かに報告したり表示したりはしません。**


2. expect は「監査官」（RSpecの機能）
ここでテスト（RSpec）の出番です。expect は、警察官（valid?）がちゃんと仕事をしたかチェックする監査官です。

役割: 「おい警察官、さっきの犯人にちゃんと違反切符を切ったか？」を確認する。
なぜ必要なのか:
valid? しただけだと、プログラムは「はい、違反切符切ってポケットに入れました（終わり）」で進んでしまいます。
テストとしては、**「ちゃんとポケットに『ニックネームがない』という違反切符が入っていること」を確認して初めて「合格」**と言えるからです。

matcherは、「expectの引数」と「想定した挙動」が一致しているかどうかを判断します。
expectの引数には検証で得られた実際の挙動を指定し、マッチャには、どのような挙動を想定しているかを記述します。



Q2. expect には何を入れるの？
A. 「今、どうなっているか調べたい中身（実測値）」を入れます。 今回は「違反切符のポケットの中身」を知りたいので、user.errors.full_messages を入れます。


Q3. なぜマッチャ（include とか eq）が必要なの？
A. 「どういう状態ならOKとするか」の基準を伝えるためです。以下解説。

監査官（expect）に「ポケットの中身（user.errors）」を渡しただけでは、監査官は困ってしまいます。

「中身が空っぽならOKなの？」
「中身が5個あればOKなの？」
「中身に『パスワード違い』って書いてあればOKなの？」
そこでマッチャを使って指示を出します。

to include("Nickname can't be blank") ➔ 「『Nickname can't be blank』という違反切符が入っていればOK（合格）としてくれ！」



Q.4　valid?はおかしいかどうか判定とエラー内容だけ残して、expectationはなにがおかしかったかの要素を明確に確認して、
includeやeqは、その決定的理由を挙げてるって理解でいい？


その理解で完璧です！ まさにその通りで、役割分担を非常に的確に捉えられています。

整理すると、以下のようになります。

valid? （判定と記録）

役割: 「おかしいかどうか判定」して、「エラー内容（証拠）」をオブジェクトの中に残す。
イメージ: 警察が現場検証して、証拠品（エラーメッセージ）を証拠品袋（user.errors）に入れる作業。
expect(...) （検証対象の指定）

役割: 「何がおかしかったかの要素」を明確にする。
イメージ: 裁判官や検査官が「証拠品袋の中身（user.errors.full_messages）を見せなさい」と指名する作業。
include / eq （決定的理由の照合）

役割: 「その決定的理由（期待する値）」と一致するか確認する。
イメージ: 「この袋の中に『ナイフ（Nickname can't be blank）』が入っているはずだ！」と突きつける作業。


   it 'nicknameが空では登録できない' do
    user = User.new(nickname: '')
    
    # 1. 判定と記録
    # 「おかしいか判定」して、エラー内容を user.errors に残す
    user.valid?

    # 2. 検証対象の指定 & 3. 決定的理由の照合
    # 「エラーメッセージのリスト(要素)」の中に、「Nickname...という文言(決定的理由)」が含まれているか？
    expect(user.errors.full_messages).to include("Nickname can't be blank")
   end

   =end




=begin

「[3] pry(#<RSpec::ExampleGroups::User::Nested>)>」これはどういう意味？

その表示は、binding.pry によってプログラムの実行が一時停止し、現在「RSpecのテストコード（describeブロック）の中にいる」ことを示しています。

それぞれの部分の意味を分解して解説します。

・[3] pry(#<RSpec::ExampleGroups::User::Nested>) の内訳
これは Pryの入力回数（履歴番号） です。コマンドを打つたびに 1, 2, 3... と増えていくだけなので、あまり気にする必要はありません。

・pry:
現在、Pry（プライ） という対話型デバッグツールが起動していることを示しています。

・(...) の中身:
ここには 「今、自分（self）はどのオブジェクトの中にいるか」 が表示されます。

・#<RSpec::ExampleGroups::User::Nested>:
これが現在の「居場所」の正体です。
RSpec::ExampleGroups: RSpecがテストを実行するために裏側で作ったグループ。
User: RSpec.describe User で指定した User モデルのテストであることを示しています。
Nested: さらに describe 'ユーザー新規登録' のようにネスト（入れ子）されたブロックの中にいることを示しています。






＊＊RSpecとは＊＊
RSpecとは、Ruby on Railsで使用されるテストフレームワークの一つです。
RSpecは、テストコードを記述するためのDSL（ドメイン固有言語）を提供し、テストの構造や内容をわかりやすく表現することができます。
RSpecは、BDD（Behavior-Driven Development）という開発手法に基づいており、テストコードを通じてアプリケーションの振る舞いを定義することができます。
RSpecは、テストコードをdescribeやitなどのメソッドを使ってグループ分けし、テストの内容を明確にすることができます。
RSpecは、テストコードの実行結果をわかりやすく表示するための フォーマットも提供しています。  

=end