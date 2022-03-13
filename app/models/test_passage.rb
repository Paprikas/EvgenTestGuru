class TestPassage < ApplicationRecord

  SUCCESS = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: :Question, optional: true

  before_validation :before_validation_first_question, on: :create

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    
    self.current_question = next_question
    save! 
  end
  
  def current_question_position
    self.test.questions.index(current_question) + 1
  end  

  def successfull?
    self.result >= SUCCESS
  end  

  def result
    self.correct_questions / test.questions.count * 100
  end  
  
  private

  def before_validation_first_question
    self.current_question = test.questions.first if test.present?
  end  

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    correct_answers_count == correct_answers.where(id: answer_ids).count &&
    correct_answers_count == answer_ids.count
  end 
  
  def correct_answers
    current_question.answers.correct
  end 
  
  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end  
end
