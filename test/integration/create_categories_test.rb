require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  test "get new category form and create category" do
    get '/categories/new'
    assert_response :success
    assert_difference('Category.count') do
      post '/categories', params:{category: {name: 'life'}}
    end
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select 'h1','Categories'
  end

  test "invalid category submit results in failures" do
    get '/categories/new'
    assert_response :success
    assert_no_difference('Category.count') do
      post '/categories', params:{category: {name: ''}}
    end
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

end
