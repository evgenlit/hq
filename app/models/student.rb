class Student < ActiveRecord::Base
  self.table_name = 'student_group'

  alias_attribute :id,  :student_group_id

  belongs_to :person, class_name: Person, primary_key: :student_id, foreign_key: :student_group_student
  belongs_to :group, class_name: Group, primary_key: :group_id, foreign_key: :student_group_group

  has_many :checkpoint_marks, foreign_key: :checkpoint_mark_student
  has_many :exams, foreign_key: :exam_student_group
  has_many :exam_students, foreign_key: :exam_student_student
  has_many :marks, foreign_key: :mark_student_group

  default_scope do
    select('student_group.*, student.*')
    .joins(:person)
    .order('last_name_hint, first_name_hint, patronym_hint')
  end

  scope :with_group, -> { joins(:group) }

  scope :filter, -> filters {
    cond = all

    if filters.key?(:name)
      fields = %w(last_name_hint first_name_hint patronym_hint)
      names = filters[:name].split(' ').map { |n| "%#{n}%" }

      cond = cond.where((["CONCAT_WS(' ', #{fields.join(',')}) LIKE ?"] * names.size).join(' AND '), *names)
    end

    if filters.key?(:status)
      cond = cond.where(student_group_status: filters[:status])
    end

    if filters.key?(:course)
      cond = cond.joins(:group).where(group: { group_course: filters[:course] })
    end

    if filters.key?(:group)
      cond = cond.where(student_group_group: filters[:group])
    end

    cond
  }

  scope :in_group_at_date, -> group, date {
    group = group.id if group.is_a?(Group)

    find_by_sql([%q(
SELECT student.*, student_group.*
FROM (
	SELECT
		`student_group`.`student_group_id`
	FROM `student_group`
	LEFT JOIN (
		SELECT *
		FROM `archive_student_group`
		JOIN `order`
			ON
				`order`.`order_id` = `archive_student_group`.`archive_student_group_order`
				AND order_signing >= :date
		ORDER BY order.order_signing DESC, order.order_id DESC
		LIMIT 1
	) AS `archive`
		ON `archive`.`student_group_id` = `student_group`.`student_group_id`
	WHERE
		`student_group`.`student_group_status` IN (101, 107)
		AND `student_group`.`student_group_group` = :group
	GROUP BY `student_group`.`student_group_id`
	HAVING
		AVG(COALESCE(archive.student_group_group, :group)) = :group
		AND COUNT(DISTINCT `archive`.`student_group_group`) <= 1
	UNION
	SELECT
		`student_group`.`student_group_id`
	FROM `student_group`
	JOIN `archive_student_group`
		ON `archive_student_group`.`student_group_id` = `student_group`.`student_group_id`
	JOIN `order`
		ON `order`.`order_id` = `archive_student_group`.`archive_student_group_order`
	WHERE
		`archive_student_group`.`student_group_status` IN (101, 107)
		AND `archive_student_group`.`student_group_group` = :group
		AND `order`.`order_signing` > :date
) AS `studentss`
JOIN student_group ON studentss.student_group_id = student_group.student_group_id
JOIN student ON student_group.student_group_student = student_id
ORDER BY last_name_hint ASC, first_name_hint ASC, patronym_hint ASC
    ), { group: group, date: date.strftime('%Y-%m-%d') }])
  }
end