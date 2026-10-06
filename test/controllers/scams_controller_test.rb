require "test_helper"

class ScamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scam = scams(:one)
  end

  test "should get index" do
    get scams_url
    assert_response :success
  end

  test "should get new" do
    get new_scam_url
    assert_response :success
  end

  test "should create scam" do
    assert_difference("Scam.count") do
      post scams_url, params: { scam: { current_place: @scam.current_place, dateofbirth: @scam.dateofbirth, email: @scam.email, moreinfo: @scam.moreinfo, person_name: @scam.person_name, phone: @scam.phone, post_id: @scam.post_id, scammer_type: @scam.scammer_type, scammerdescription: @scam.scammerdescription } }
    end

    assert_redirected_to scam_url(Scam.last)
  end

  test "should show scam" do
    get scam_url(@scam)
    assert_response :success
  end

  test "should get edit" do
    get edit_scam_url(@scam)
    assert_response :success
  end

  test "should update scam" do
    patch scam_url(@scam), params: { scam: { current_place: @scam.current_place, dateofbirth: @scam.dateofbirth, email: @scam.email, moreinfo: @scam.moreinfo, person_name: @scam.person_name, phone: @scam.phone, post_id: @scam.post_id, scammer_type: @scam.scammer_type, scammerdescription: @scam.scammerdescription } }
    assert_redirected_to scam_url(@scam)
  end

  test "should destroy scam" do
    assert_difference("Scam.count", -1) do
      delete scam_url(@scam)
    end

    assert_redirected_to scams_url
  end
end
