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
  
  def test_with_no_options
    assert_equal( "Name,Id,Age\nAry,1,25\nNati,2,22\n", @users.to_csv )
  end    
  
  def test_with_no_headers
    assert_equal( "Ary,1,25\nNati,2,22\n", @users.to_csv(:headers => false) )
  end
  
  def test_with_only
    assert_equal( "Name\nAry\nNati\n", @users.to_csv(:only => 'name') )
  end
  
  def test_with_empty_only
    assert_equal( "", @users.to_csv(:only => "") )
  end
  
  def test_with_only_and_wrong_column_names
    assert_equal( "Name\nAry\nNati\n", @users.to_csv(:only => ['name', :yoyo]) )
  end  
  
  def test_with_except
    assert_equal( "Age\n25\n22\n", @users.to_csv(:except => [:id, 'name']) )
  end

  def test_with_except_and_only_should_listen_to_only
    assert_equal( "Name\nAry\nNati\n", @users.to_csv(:except => [:id, 'name'], :only => 'name') )
  end
end