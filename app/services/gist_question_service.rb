# frozen_string_literal: true

class GistQuestionService
  def initialize(test_passage, client: nil)
    @test_passage = test_passage
    @user = test_passage.user
    @question = test_passage.current_question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['PERSONAL_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
    @user.gists.create(gist_url: gist_url, question_id: @question.id) if success?
  end

  def gist_url
    @client.last_response.data.html_url
  end

  def success?
    @client.last_response.status == 201
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description', title: @test.title),
      files: {
        'tes-guru-question.txt' => {
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
