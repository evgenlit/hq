class Study::AnalyseController < ApplicationController
  
  def index
    if current_user.is?(:typer) 
      redirect_to root_path
    end 
    collision = ActiveRecord::Base.connection.execute("
    SELECT 
    GROUP_CONCAT(study_marks.mark SEPARATOR '-') AS mmmarks, 
    GROUP_CONCAT(study_marks.retake SEPARATOR '-') AS rrretakes,
    study_marks.*, study_subjects.*
    FROM study_marks
    JOIN study_subjects ON subject_id = study_subjects.id
    GROUP BY 
      study_subjects.year, study_subjects.semester, study_subjects.group_id, 
      study_subjects.title, study_subjects.kind, study_marks.student_id
    HAVING COUNT(DISTINCT study_marks.mark) > 1 OR
    COUNT(DISTINCT study_marks.retake) > 1;")
    @collisions = []
    collision.each do |c|
      marks=c[0].split('-')
      retakes=c[1].split('-')
      errors = []
      errors << 'оценка'    if marks.uniq.size > 1
      errors << 'пересдача' if retakes.uniq.size > 1
      @collisions.push({ subject: Study::Subject.find(c[10]), 
        student: Student.find(c[4]), mark: Study::Mark.find(c[2]),
                            error_txt: errors.join(' и ') })
    end
    unless @collisions.kind_of?(Array)
      @collisions = @collisions.page(params[:page]).per(20)
    else
      @collisions = Kaminari.paginate_array(@collisions).page(params[:page])
      .per(20)
    end
  end
end