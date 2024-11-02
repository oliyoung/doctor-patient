class ConversationsController < ProtectedController
  before_action :set_conversations, only: [:index, :show]

  def index
    @conversation = @conversations.first
    @messages = @conversation.messages
    render template: "conversations/show"
  end

  def show
    @conversation = @conversations.first
    @messages = @conversation.messages
  end


  protected
  def set_conversations
    @conversations = current_user.conversations.order(created_at: :desc)
  end
end
