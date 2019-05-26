class AttachmentsController < ApplicationController
  def index
    @attachments = Attachment.all
  end

  def new
   @attachment = Attachment.new
  end

  def create
   @attachment = Attachment.new(permitted_params)

   if @attachment.save
    redirect_to attachments_path, notice: "Successfully uploaded."
  else
    render "new"
  end   
    # respond_to do |format|
    #   if @attachment.save
    #     format.html { redirect_to @attachment, message: 'File uploaded successfully' }
    #     format.json { render :show, status: :created, location: @attachment }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @attachment.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def show
    @attachment = Attachment.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

  def permitted_params
   params.require(:attachment).permit(:title, :description, files: [])
 end
end
