class Group < ActiveRecord::Base
  self.table_name = 'group'

  alias_attribute :id,     :group_id
  alias_attribute :course, :group_course
  alias_attribute :number, :group_number
  alias_attribute :form,   :group_form

  belongs_to :speciality, primary_key: :speciality_id, foreign_key: :group_speciality

  has_many :students, foreign_key: :student_group_group
  has_many :exams, foreign_key: :exam_group
  has_many :subjects, foreign_key: :subject_group

  default_scope do
    where('group_speciality != 1')
  end

  scope :from_speciality, -> speciality { where(group_speciality: speciality) }
  scope :from_course, -> course { where(group_course: course) }
  scope :from_form, -> form { where(group_form: form) }
  scope :from_faculty, -> faculty {
    joins(:speciality).where(speciality: { speciality_faculty: faculty })
  }

  scope :filter, -> filters {
    [:speciality, :course, :form, :faculty].inject(all) do |cond, field|
      if filters.include?(field) && !filters[field].empty?
        cond = cond.send "from_#{field.to_s}", filters[field]
      end

      cond
    end
  }

  def name
    n = []

    case form
      when 101
        n << 'Д'
      when 102
        n << 'В'
      when 103
        n << 'З'
      when 105
        n << 'З'
    end

    case speciality.faculty.id
      when Department::FITIM
        n << 'Ц'
      when Department::FPT
        n << 'Т'
      when Department::FRISO
        n << 'Р'
      when Department::FIDIZH
        n << 'К'
      when Department::FEIM
        n << 'Э'
      when Department::FGI
        n << 'Г'
    end

    n << speciality.suffix

    n << 'Б' if speciality.bachelor?
    n << 'М' if speciality.master?

    n << "-#{course}-#{number}"
    n.join
  end

end