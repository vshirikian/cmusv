class PersonSearchController < ApplicationController
  before_filter :require_user, :except => [:show_by_twiki]

# Floating box source: http://roshanbh.com.np/2008/07/top-floating-message-box-using-jquery.html

  layout 'cmu_sv'


#  auto_complete_for :person, :human_name
#  protect_from_forgery :only => [:create, :update, :destroy] #required for auto complete to work

  # GET /people
  # GET /people.xml
  def index
    if params[:company]
        @people = Person.find(:all, :conditions => [
            "organization_name LIKE ? and graduation_year LIKE ? and masters_program LIKE ?",
            "%#{params[:company]}",
            "%#{params[:graduation_year]}",
            "%#{params[:masters_program]}"])
#      if development?
#        @people = Person.find(:all, :conditions => ['human_name LIKE ?', "%#{params[:search]}%"])
#      else
#        @people = Person.find(:all, :conditions => ['human_name ILIKE ?', "%#{params[:search]}%"])
#      end
    else
        @people = Person.find(:all, :conditions => ['is_active = ?', true],  :order => "first_name ASC, last_name ASC")
    end
  end

end
