class AttachmentsController < ApplicationController
  before_action :set_attachment, only: %i[show destroy download]
  def index
    @attachments = Attachment.all
  end

  def new
   @attachment = Attachment.new
  end

  def download
    if @attachment.downloaded == true
      format.html { redirect_to @attachment, message: 'File has already been downloaded.' }
    else
      @attachment.downloaded = true
      file_key = params[:file]
      @blob_attachment = ActiveStorage::Blob.find_by_key(file_key)
      send_data @blob_attachment, filename: @blob_attachment.filename, type: @blob_attachment.content_type, disposition: 'attachment'

    end
  end

  def create
    @attachment = Attachment.new(permitted_params)

    if @attachment.save
      redirect_to attachments_path, notice: "Successfully uploaded."
    else
      render "new"
    end
  end

  def show
  end

  def update
  end

  def destroy
    @attachment.destroy
    redirect_to attachments_path, notice: 'Attachment has been destroyed.'
  end

  def edit
  end

  def update
  end

  private

  def permitted_params
   params.require(:attachment).permit(:title, :description, files: [])
 end

  def set_attachment
    @attachment = Attachment.find(params[:id])
  end
end
