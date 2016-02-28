class ChangePeopleWeightToPeopleBuild < ActiveRecord::Migration
  def change
    rename_column :people, :weight, :build
  end
end
