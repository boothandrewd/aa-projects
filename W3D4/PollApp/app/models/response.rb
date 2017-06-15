class Response < ApplicationRecord
  validates :user_id, :answer_choice_id, presence: true
  validate :no_duplicate_responses

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    question.responses.where.not(id: id)
  end

  def respondent_already_answered?
    sibling_responses.includes(:respondent).any? do |response|
      response.respondent.id == user_id
    end
  end

  def no_duplicate_responses
    if respondent_already_answered?
      errors[:response] << "can't be duplicate"
    end
  end
end
