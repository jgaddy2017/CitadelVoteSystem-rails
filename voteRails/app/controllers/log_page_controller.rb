class LogPageController < ApplicationController
  def index
  end
  
  def create
	  @cwid = params[:cwid]
	  @company = params[:company]
	  result = Cadet.where("cwid = ? AND company = ?", @cwid, @company)
	  if result.length > 0
		  already_voted = Ballad.where("cadetCwid = ?", @cwid)
		  if already_voted.length < 1
			  saveCadet(@cwid, @company)
			  redirect_to(:controller => 'log_page', :action => 'show')
		  else
			  session[:endmessage] = "You have already voted"
			  redirect_to(:controller => 'log_page', :action => 'thanks')
		  end
	  end
  end
  
  def show
	  @company = session[:cadetCompany]
	  @result = Candidate.where("company = ?", @company)
  end
  
  def castVote
	  if session[:cadetCwid] == nil? && session[:cadetCompany] == nil?
		  redirect_to(:controller => 'log_page', :action => 'index')
	  end
	  @ballad = params[:candidateList]
	  @cwid = session[:cadetCwid]
	  @castBallad = Ballad.new
	  @castBallad.cadetCwid = @cwid
	  @castBallad.candidateId = @ballad
	  @castBallad.save!
	  session[:endmessage] = "Thank you for voting"
	  redirect_to(:controller => 'log_page', :action => 'thanks')
  end
  
  def thanks
	  @endmessage = session[:endmessage]
	  session.delete(:cadetCwid)
	  session.delete(:cadetCompany)
  end
  
  
  private 
	def saveCadet(cwid, company)
		session[:cadetCwid] = cwid
		session[:cadetCompany] = company
	end
end
