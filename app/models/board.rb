# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  content    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
class Board < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    validates :content, length: { minimum: 2, maximum: 100 }
    belongs_to :user
    has_many :tasks

end
