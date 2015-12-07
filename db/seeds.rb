Page.all.destroy_all
Page.find_or_create_by(name: 'home') do |page|
  page.text = <<eos
Welcome to CaseDB.
eos
end

Page.find_or_create_by(name: 'about') do |page|
  page.text = <<eos
# History

CaseDB started when me and my fiance (now wife) were talking about
famous serial killers (we're Crime Scene / Digital Forensics
graduates, we do that sometimes). At some point in the future we're
hoping to create a book on some of the most interesting cases. Until
that time I'm hoping this will be a useful research tool as well as a
pretty cool catalogue in itself.
eos
end
