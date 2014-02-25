require 'test_helper'

class MainArticlesControllerTest < ActionController::TestCase
  setup do
    @main_article = main_articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:main_articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create main_article" do
    assert_difference('MainArticle.count') do
      post :create, main_article: { author_id: @main_article.author_id, content: @main_article.content, date: @main_article.date, subtitle: @main_article.subtitle, title: @main_article.title }
    end

    assert_redirected_to main_article_path(assigns(:main_article))
  end

  test "should show main_article" do
    get :show, id: @main_article
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @main_article
    assert_response :success
  end

  test "should update main_article" do
    patch :update, id: @main_article, main_article: { author_id: @main_article.author_id, content: @main_article.content, date: @main_article.date, subtitle: @main_article.subtitle, title: @main_article.title }
    assert_redirected_to main_article_path(assigns(:main_article))
  end

  test "should destroy main_article" do
    assert_difference('MainArticle.count', -1) do
      delete :destroy, id: @main_article
    end

    assert_redirected_to main_articles_path
  end
end
