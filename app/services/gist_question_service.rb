class GistQuestionService

    ACCESS_TOKEN = ENV['GITHUB_GIST_TOKEN']
  
    def initialize(question, client: nil)
      @question = question
      @test = @question.test
      @client = client || Octokit::Client.new(:access_token => ACCESS_TOKEN)
    end  
  
    def call
      @client.create_gist(gist_params)
      @response = @client.last_response
    end 
    
    def success?
      @client.last_response.status < 400
    end  
  
    private
    
    def gist_params
      {
        description: "A question #{@question.body} about #{@test.title} from TestGuru",
        files: {
          'test-guru-question.txt' => {
            content: gist_content  
          }  
        }
      }
    end
    
    def gist_content
      content = [@question.body]
      content += @question.answers.pluck(:body)
      content.join("\n")
    end
  
  end   