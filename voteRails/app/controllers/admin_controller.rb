class AdminController < ApplicationController
  def adminIndex
  end
  def enter
	  adminPass = params[:adminPass]
	  adminUser = params[:adminUser]
	  if adminPass == "pass" && adminUser == "user"
		  redirect_to(:controller => 'admin', :action => 'panel')
	  end

  end
  def panel
	  @placedVotes = Candidate.find_by_sql("SELECT DISTINCT candidates.name, candidates.company, count(ballads.candidateId) AS Number FROM candidates, ballads WHERE candidates.id = ballads.candidateId GROUP BY candidates.name ORDER BY candidates.company")
	  @organizedVotes = @placedVotes.pluck(:name, :Number, :company)
	  @companyName = @placedVotes[0][:company] unless @organizedVotes.size == 0
	  @candidates = Candidate.all
  end
  
  def cadetManagement
  end
  
  def addDeleteCandidates
	  if params[:addCandidate]
		  newCandidatesCompany = params[:company]
		  newCandidatesList = params[:newCandidate]
		  addNewCan(newCandidatesCompany, newCandidatesList)
	  elsif params[:deleteCandidate]
		  deleteCandidatesList = params[:candidateList]
		  deleteOldCan(deleteCandidatesList)
	  end
	  redirect_to :back
  end
  
  private
  	def addNewCan(newCandidatesCompany, newCandidatesList)
		canList = newCandidatesList.split('|')
		canList.each do |can|
			@newCandidate = Candidate.new
			@newCandidate.name = can
			@newCandidate.company = newCandidatesCompany
			@newCandidate.save!
		end
	end

  private
  	def deleteOldCan(deleteCandidatesList)
		Candidate.find(deleteCandidatesList).destroy unless deleteCandidatesList.nil?
	end
  
end
