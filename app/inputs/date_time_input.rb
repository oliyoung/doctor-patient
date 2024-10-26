class DateTimeInput < SimpleForm::Inputs::DateTimeInput
  private
  def use_html5_inputs?
    input_options.fetch(:html5, true)
  end
end
