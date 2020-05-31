# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    url = "https://github.com/#{author}/#{repo}"
    link_to 'TestGuru', "https://github.com/#{author}/#{repo}", target: :_blank
  end
end
