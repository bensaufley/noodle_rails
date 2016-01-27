class OptionDecorator < Draper::Decorator
  delegate_all

  def vote_breakdown
    counts = model.votes.unscope(:order).group(:value).count
    max = (counts.values + [1]).max
    h.capture do
      { 1 => 'Y', 0 => 'M', -1 => 'N'}.each do |k, v|
        h.concat(h.content_tag counts[k] == max ? :strong : :span, " #{v}:#{counts[k] || 0} ")
      end
    end
  end
end
