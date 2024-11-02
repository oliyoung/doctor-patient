class MessagesController < ProtectedController
  before_action :set_conversation

  def index
  end

  def new
  end

  def create
    @message = @conversation.messages.new(user: current_user, body: body)
    if @message.save
      respond_to do |format|
        format.html { redirect_to @conversation }
        format.turbo_stream
      end
    else
      render :new, status: 403
    end
  end

  protected
  def set_conversation
    @conversation = current_user.conversations.find(params[:conversation_id])
  end

  def messages_params
    params.require(:message).permit(:body, :conversation_id)
  end
end
