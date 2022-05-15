class GistsController < ApplicationController
  before_action :set_test_passage, only: %i[ create ]

  
  # GET /gists/new
  def new
    @gist = Gist.new
  end

  # GET /gists/1/edit
  def edit
  end

  # POST /gists or /gists.json
  def create
    client = GistQuestionService.new(@test_passage.current_question)
    result = client.call
    
    
    flash_options = if client.success?

      gist_save(@test_passage.user, @test_passage.current_question.id, result.data.html_url)
      flash_options = { notice: t('.success', link_to: '#{@gist.url}') }
            
    else
       flash_options = { alert: t('.failure') } 
    end   

    redirect_to @test_passage, flash_options

  end

  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_passage
      @test_passage = TestPassage.find(params[:test_passage_id])
    end

    def gist_save(user, question, url)
      @gist = user.gists.new(question_id: question, url: url,)
      @gist.save!

    end  
    
end
