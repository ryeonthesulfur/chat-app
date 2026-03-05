class CreateRoomUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :room_users do |t|
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end



=begin
*＊「t.references :user」とは？*＊
「t.references :user」を使うと、user_id という名前のカラムを作成します（Railsの慣習で _id が自動でつきます）。
検索を高速化するためのインデックス（index）も自動的に作成されます。


**「null: false」とは？**
「null: false」は、そのカラムにNULL値を許可しないことを意味します。
つまり、room_id と user_id は必ず値が必要で、空のままにすることはできません。

データベース上で NOT NULL 制約を追加します。
つまり、user_id が空（nil）の状態ではデータを保存できないようにします（必ずユーザーと紐付いている必要があります）。


**「foreign_key: true」とは？**
データベースレベルで「外部キー制約」を追加します。
これにより、users テーブルに実在する id しか user_id カラムに入らないことが保証されます（存在しないユーザーIDを登録しようとするとエラーになります）。
=end
