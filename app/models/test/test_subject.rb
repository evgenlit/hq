class Subject < ActiveRecord::Base
  self.table_name = 'subject'

  alias_attribute :id,       :subject_id
  alias_attribute :name,     :subject_name
  alias_attribute :semester, :subject_semester
  alias_attribute :year,     :subject_year
  alias_attribute :brs,      :subject_brs

 
  belongs_to :group, class_name: Group, primary_key: :group_id, foreign_key: :subject_group

  has_many :checkpoints, foreign_key: :checkpoint_subject
  has_many :exams, foreign_key: :exam_subject
  has_many :subject_teachers
  has_many :users, :through => :subject_teachers

end