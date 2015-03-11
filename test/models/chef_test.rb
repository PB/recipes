require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(chefname: "Roman", email: "roman@mailinator.com" )
  end
  
  test "chef should be valid" do
    assert @chef.valid?
  end
  
  test "chefname sholud be present" do
    @chef.chefname = ""
    assert_not @chef.valid?
  end
  
  test "chefname length should not be longer than 250 chars" do
    @chef.chefname = 'a' * 251
    assert_not @chef.valid?
  end
  
  test "chefname length should not be shorter than 5 chars" do
    @chef.chefname = 'a'
    assert_not @chef.valid?
  end
  
    test "email sholud be present" do
    @chef.email = ""
    assert_not @chef.valid?
  end
  
  test "email length should not be longer than 250 chars" do
    @chef.email = 'a' * 251 + '@e.pl'
    assert_not @chef.valid?
  end
  
  test "email length should not be shorter than 5 chars" do
    @chef.email = 'e.pl'
    assert_not @chef.valid?
  end
  
  test "email should be unique" do
    chef2 = @chef.dup
    chef2.email = @chef.email.upcase
    @chef.save
    assert_not chef2.valid?
  end
  
  test "should not save chef without chefname" do
    chef = Chef.new
    assert_not chef.save 
  end
  
  test "email should be valid" do
    valid_addresses = %w[janek@mailinator.com TEST-TEST@mailinator.com.pl janek.franek@mailinator.com janek+franek@m.pl]
    valid_addresses.each do |email|
      @chef.email = email
      assert @chef.valid?, "#{email.inspect} should be valid"
    end
  end
  
  test "invalid email should be rejected" do
    invalid_addresses = %w[janek@.com TEST-TESTmailinator.com.pl janek.@franek@mailinator.com janek:franek@m.pl]
    invalid_addresses.each do |email|
      @chef.email = email
      assert_not @chef.valid?, "#{email.inspect} should be invalid"
    end
  end
end