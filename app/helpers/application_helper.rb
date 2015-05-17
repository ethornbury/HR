module ApplicationHelper
    
    # Returns the full title on a per-page basis.      
      def full_title(page_title = '')                     # Method def, optional arg
        base_title = "HR App"  # Variable assignment
        if page_title.empty?                              # Boolean test
          base_title                                      # Implicit return
        else
          "#{page_title} | #{base_title}"                 # String interpolation
        end
      end
      
      def bootstrap_class_for flash_type
        case flash_type
          when :success
            "alert-success" # Green
          when :error
            "alert-danger" # Red
          when :alert
            "alert-warning" # Yellow
          when :notice
            "alert-info" # Blue
          else
            flash_type.to_s
        end
      end
   
end
