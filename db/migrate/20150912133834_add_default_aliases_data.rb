class AddDefaultAliasesData < ActiveRecord::Migration
  def up
    Person.all.each do |p|
      a = p.aliases.first
      a.default = true
      a.save
    end
  end
  def down
    Alias.all.each do |a|
      a.default = false
      a.save
    end
  end
end
