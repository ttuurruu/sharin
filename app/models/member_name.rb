class MemberName < ActiveRecord::Base

  belongs_to :user

  default_scope { where("member_names.deleted_at IS NULL") }

  #対象者の全レコード
  scope :get_mylist, ->(id) { where(user_id: id).order(started_on: :desc) }
  #対象者の現時点で有効なレコード
  scope :get_mylist_active, ->(id) { where(user_id: id).where('started_on <=?', Date.current ).where('ended_on >=?',Date.current).first }
  #対象者の特定の終了日のレコード
  scope :get_mylist_day, ->(id,day) { where(user_id: id).where(ended_on: day).first }

  #CSV出力
  def self.to_csv(member_names,options = {})
    csv_data = CSV.generate(force_quotes: true) do |csv|
      csv << csv_column_names
      member_names.each do |member_name|
        csv << member_name.csv_column_values
      end
    end
    csv_data.encode(Encoding::SJIS)
  end

  def self.csv_column_names
    [
        MemberName.human_attribute_name("started_on"),
        MemberName.human_attribute_name("ended_on"),
        User.human_attribute_name("code"),
        MemberName.human_attribute_name("name"),
        MemberName.human_attribute_name("name_katakana"),
        MemberName.human_attribute_name("name_romaji"),
        MemberName.human_attribute_name("register"),
        MemberName.human_attribute_name("register_katakana"),
        MemberName.human_attribute_name("register_romaji"),
        MemberName.human_attribute_name("memo")
    ]
  end

  def csv_column_values
    [
        started_on,
        ended_on,
        user.code,
        name,
        name_katakana,
        name_romaji,
        register,
        register_katakana,
        register_romaji,
        memo
    ]
  end

end
