class Formatter < Redcarpet::Render::HTML
  include ActionView::Helpers
  include ActionDispatch::Routing
  include Rails.application.routes.url_helpers
  
  @@links = /<(.*)\?(.*)>/
 
  def initialize(options = {})
    @models = {Event => :date,
               CaseFile => :name,
               Person => :name}
    super(options)
  end
  
  def preprocess(text)
    parse_special_links(text)
  end

  def parse_special_links(text="")
    text.gsub! @@links do
      model,link = $1,$2
      mod = model.camelize.constantize

      if @models.keys.include? mod
        con = model.tableize
        ins = mod.find_by_id link
        
        url = url_for(controller: con, action: :show, id: link)
        if(ins == nil)
          tag = "invalid link"
        else
          tag = ins.send @models[mod]
        end
        "[#{tag}](#{url})"
      else
        "invalid"
      end
#      case model
#      when "event"
#        url = url_for(controller: model.tableize,
#                      action: :show,
#                      id: link)
#        
#        "[#{Event.find(link).date}](#{url_for(url)})"
#      when "case_file"
#        "CaseFileLink"
#      when "person"
#        "PersonLink"
#      end
    end
    return text
  end
end
