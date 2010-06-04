require File.dirname(__FILE__) + '/test_helper'

class ToCsvHashTest < Test::Unit::TestCase
  def setup
    @users = [{
      :id => 1,
      'name' => 'Ary',
      :age => 25
    },{
      :id => 2,
      'name' => 'Nati',
      :age => 22
    }]
  end
  
  def test_with_headers
    assert_equal( "name,id,age\nAry,1,25\nNati,2,22\n", @users.to_csv )
  end    
  
  def test_with_no_headers
    assert_equal( "Ary,1,25\nNati,2,22\n", @users.to_csv(:headers => false) )
  end
end