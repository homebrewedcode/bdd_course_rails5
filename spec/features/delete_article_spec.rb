require 'rails_helper'

RSpec.feature "While editing an article" do

  before do
    john = User.create(email: "john@example.com", password: "password")
    login_as(john)
    @article = Article.create(title: "Title One", body: "Body of article one", user: john)
  end

  scenario "a user clicks 'Delete Article'" do
    visit "/"

    click_link @article.title
    click_link "Delete Article"

    expect(page).to have_content("Article has been deleted")
    expect(current_path).to eq(articles_path)
  end

end
