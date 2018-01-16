module ArticlesHelper
  def persisted_comments(comments)
    # note this is the same as comments.reject { |comment| comment.new_record? }
    # quicker cooler 'colon pretzel' syntax
    comments.reject(&:new_record?)
  end
end
