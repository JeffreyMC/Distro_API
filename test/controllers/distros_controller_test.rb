require "test_helper"

class DistrosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @distro = distros(:one)
  end

  test "should get index" do
    get distros_url, as: :json
    assert_response :success
  end

  test "should create distro" do
    assert_difference("Distro.count") do
      post distros_url, params: { distro: { nombre: @distro.nombre, url: @distro.url } }, as: :json
    end

    assert_response :created
  end

  test "should show distro" do
    get distro_url(@distro), as: :json
    assert_response :success
  end

  test "should update distro" do
    patch distro_url(@distro), params: { distro: { nombre: @distro.nombre, url: @distro.url } }, as: :json
    assert_response :success
  end

  test "should destroy distro" do
    assert_difference("Distro.count", -1) do
      delete distro_url(@distro), as: :json
    end

    assert_response :no_content
  end
end
