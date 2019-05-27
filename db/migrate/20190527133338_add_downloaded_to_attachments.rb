class AddDownloadedToAttachments < ActiveRecord::Migration[5.2]
  def change
    add_column :attachments, :downloaded, :boolean
  end
end
