class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :text, presence: true, unless: :image?

  mount_uploader :image, ImageUploader

  private
  def message_params
    params.require(:message).permit(:text).merge(group_id: current_group.id)
  end
end
