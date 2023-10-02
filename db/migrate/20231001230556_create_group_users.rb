class CreateGroupUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :group_users do |t|
      
      t.references :user, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true
      #foreign_key: trueにすることでuserとgroupが外部キーであることを記述。indexとは、処理を早くするための記述（詳細不明）
      
      t.timestamps
    end
  end
end
