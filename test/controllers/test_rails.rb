require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    begin
      assert (get posts_url), '$1.FAILED : get index가 제대로 호출되지 않았습니다.#'
      assert_response :success
      puts '$1.PASS#'
    rescue Exception
      puts '$1.FAILED : get index가 제대로 호출되지 않았습니다.#'
    end
  end

  test "should get new" do
    begin
      assert (get new_post_url), '$2.FAILED : get new가 제대로 호출되지 않았습니다.#'
      assert_response :success
      puts '$2.PASS#'
    rescue
      puts '$2.FAILED : get new가 제대로 호출되지 않았습니다.#'
    end
  end

  test "should create post" do
    begin
      assert_difference('Post.count', 1, '$3.FAILED : create post가 제대로 호출되지 않았습니다.#') do
        post posts_url, params: { post: { content: @post.content, name: @post.name, title: @post.title } }
      end

      assert_redirected_to post_url(Post.last), '$3.FAILED : create post가 제대로 호출되지 않았습니다.#'
      assert_equal 'Post was successfully created.', flash[:notice]

      puts '$3.PASS#'
    rescue
      puts '$3.FAILED : create post가 제대로 호출되지 않았습니다.#'
    end
  end

  test "should show post" do
    begin
      assert (get post_url(@post)), '$4.FAILED : show post가 제대로 호출되지 않았습니다.#'
      assert_response :success

      puts '$4.PASS#'
    rescue
      puts '$4.FAILED : show post가 제대로 호출되지 않았습니다.#'
    end
  end

  test "should get edit" do
    begin
      assert (get edit_post_url(@post)), '$5.FAILED : get edit가 제대로 호출되지 않았습니다.#'
      assert_response :success

      puts '$5.PASS#'
    rescue
      puts '$5.FAILED : get edit가 제대로 호출되지 않았습니다.#'
    end
  end

  test "should update post" do
    begin
      patch post_url(@post), params: { post: { content: @post.content, name: @post.name, title: @post.title } }
      assert_redirected_to post_url(@post), '$6.FAILED : update post가 제대로 호출되지 않았습니다.#'

      puts '$6.PASS#'
    rescue
      puts '$6.FAILED : update post가 제대로 호출되지 않았습니다.#'
    end
  end

  test "should destroy post" do
    begin
      assert_difference('Post.count', -1, '$7.FAILED : destroy post가 제대로 호출되지 않았습니다.#') do
        delete post_url(@post)
      end

      assert_redirected_to posts_url, '$7.FAILED : destroy post가 제대로 호출되지 않았습니다.#'

      puts '$7.PASS#'
    rescue
      puts '$7.FAILED : destroy post가 제대로 호출되지 않았습니다.#'
    end
  end

  test "should model test" do
    begin
      post = Post.create(:content => @post.content, :name => '', :title => '1234' )
      assert post.save, '$8.PASS#'

      puts '$8.FAILED : post 제약조건을 만족하지 못하였습니다.#'
    rescue
      puts '$8.FAILED : post 제약조건을 만족하지 못하였습니다.#'
    end
  end
end