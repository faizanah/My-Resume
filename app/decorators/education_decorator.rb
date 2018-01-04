class EducationDecorator < Draper::Decorator
  delegate_all

  def school
    h.link_to object.school_name , object.school_url , target: '_blank'
  end

  def period
    end_time = object.period_end.nil? ? "Present" : object.period_end.strftime("%B %Y")
    "#{object.period_start.strftime("%B %Y")} - #{end_time}"
  end
end
