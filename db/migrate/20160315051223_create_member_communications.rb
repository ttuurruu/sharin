class CreateMemberCommunications < ActiveRecord::Migration
  def change
    create_table :member_communications do |t|
      t.integer :user_id
      t.string :email1
      t.string :email2
      t.string :email3
      t.string :email4
      t.string :email5
      t.string :number1
      t.string :number2
      t.string :number3
      t.string :number4
      t.string :number5
      t.string :id1
      t.string :id2
      t.string :id3
      t.string :id4
      t.string :id5
      t.string :google
      t.string :facebook
      t.string :twitter
      t.string :skype
      t.string :slack
      t.string :github
      t.string :linkedin
      t.string :dropbox
      t.string :instagram
      t.string :paypal
      t.string :pinterest
      t.string :slideshare
      t.string :stack_overflow
      t.string :trello
      t.string :tumblr
      t.string :youtube
      t.string :line
      t.string :hipchat
      t.string :chatwork
      t.string :qiita
      t.string :esa
      t.string :memo

      t.timestamps null: false
    end
  end
end
