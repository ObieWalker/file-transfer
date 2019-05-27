class Attachment < ApplicationRecord
  has_many_attached :files

  def path_for(file)
    ActiveStorage::Blob.service.path_for(file.blob.key)
  end
end
