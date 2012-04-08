class Representative < ActiveRecord::Base
  belongs_to :party
  belongs_to :district
  has_and_belongs_to_many :committees, :order => :name

  has_many :vote_results
  has_many :votes, :through => :vote_results

  validates_uniqueness_of :first_name, :scope => :last_name # TODO: :scope => :period ?!

  def display_name
    "#{last_name}, #{first_name}"
  end

  def human_alternate
    alternate? ? I18n.t("app.yes") : I18n.t("app.no")
  end
end
