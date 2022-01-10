require 'rails_helper'

RSpec.describe 'posts/index', type: :view do
  fixtures :authors

  before(:each) do
    assign(:posts, Kaminari.paginate_array([
                                             Post.create!(
                                               title: 'Title',
                                               body: 'MyText',
                                               user_id: 2
                                             ),
                                             Post.create!(
                                               title: 'Title',
                                               body: 'MyText',
                                               user_id: 2
                                             )
                                           ]).page(1))
  end

  it 'renders a list of posts' do
    author = authors(:one)
    login_as(author)
    render
    assert_select 'ul' do
      assert_select 'li', 2
    end
  end
end
