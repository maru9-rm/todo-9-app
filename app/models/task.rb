# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  content    :text
#  deadline   :datetime
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_tasks_on_board_id  (board_id)
#  index_tasks_on_user_id   (user_id)
#
class Task < ApplicationRecord
    belongs_to :board
    belongs_to :user
    has_many :comments, dependent: :destroy
    validates :title, presence: true
    validates :content, presence: true
    validates :content, length: { minimum: 2, maximum: 100 }
    has_one_attached :eyecatch

end
