require 'rails_helper'

RSpec.describe "comments/index", type: :view do
  fixtures :all
  before(:each) do
    assign(:author, authors(:one))
    assign(:post, posts(:one))
    assign(:comments, Kaminari.paginate_array([
      Comment.create!(
        body: "MyText",
        author: authors(:one),
        post: posts(:one)
      ),
      Comment.create!(
        body: "MyText",
        author: authors(:one),
        post: posts(:one)
      )
    ]).page(1))
  end

  it "renders a list of comments" do
    author = authors(:one)
    login_as(author)
    render
    assert_select 'ul' do
      assert_select 'li', 2
    end
  end
end
