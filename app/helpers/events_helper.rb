module EventsHelper
    def nil_helper(field)
        if(field==nil)
            ""
        else
            field.event_type
        end
    end
end
