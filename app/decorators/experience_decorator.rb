class ExperienceDecorator < ApplicationDecorator
  delegate_all

    def organization
      h.link_to object.organization_name , object.organization_url , target: '_blank'
    end

    def period
      end_time = object.period_end.nil? ? "Present" : object.period_end.strftime("%B %Y")
      "#{object.period_start.strftime("%B %Y")} - #{end_time}"
    end
end
