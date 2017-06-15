class Question < ApplicationRecord
  validates :poll_id, presence: true

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def n_plus_1_results
    counts = {}
    answer_choices.each do |answer_choice|
      counts[answer_choice.body] = answer_choice.responses.count
    end

    counts
  end

  def results
    # responses.each_with_object({}) do |answer_choice, counts|
    answer_choices.includes(:responses).each_with_object({}) do |answer_choice, counts|
      counts[answer_choice.body] = answer_choice.responses.length
    end
  end

  def better_results
    # .select("answer_choices.body, COUNT(responses.id)")
    (AnswerChoice
      .joins(:question)
      .joins("LEFT JOIN responses ON answer_choices.id = responses.answer_choice_id")
      .where("questions.id = ?", id)
      .group("answer_choices.id")
      .pluck("answer_choices.body, COUNT(responses.id)")).inject ({}) do |hash, (k,v)|
        hash[k] = v
        hash
      end
  end
end
