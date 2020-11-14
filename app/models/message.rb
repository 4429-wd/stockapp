class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :content, presence: true, unless: :image?

  # mount_uploader :image, ImageUploader

  private
  def message_params
    params.require(:message).permit(:content).merge(group_id: current_group.id)
  end
end
