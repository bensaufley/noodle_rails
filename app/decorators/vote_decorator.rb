class VoteDecorator < Draper::Decorator
  delegate_all

  def word_value
    case model.value
      when 1
        'Yes'
      when -1
        'No'
      when 0
        'Maybe'
      else
        ''
    end
  end

  def classname
    word_value.downcase
  end

end
