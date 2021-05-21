require File.expand_path('../../test_helper', __FILE__)
require File.expand_path('../../../lib/bioinf_common/utils', __FILE__)

class UtilitiesTest < ActiveSupport::TestCase
  include BioinfCommon::Utilities

  ActiveRecord::FixtureSet.create_fixtures(File.dirname(__FILE__) + '/../fixtures/',
    [:projects])

  def test_semiString2list
    input = "Zork1 ; Zork2;Zork3"
    result = semiString2List(input)
    assert_equal(3,result.length,"Result not of length 3")
    assert_equal("Zork1",result[0],"Item 0 not equal to 'Zork1'")
    assert_equal("Zork2",result[1],"Item 1 not equal to 'Zork2'")
    assert_equal("Zork3",result[2],"Item 2 not equal to 'Zork3'")
  end

  def test_includeProject
    plist = []
    proj = Project.find_by(name: 'eCookbook')
    includeProject(proj,plist)
    assert_equal(5,plist.length,"Plist wrong length.")
    assert_equal(1,plist[0],"Parent ID wrong")
    assert(plist.include?(4),"Missing project 4")
    assert(plist.include?(5),"Missing project 5")
    assert(plist.include?(6),"Missing project 6")
  end

  def test_collectProjects
    str = "alpha ; eCookbook"
    plist = collectProjects(str)
    assert_equal(8,plist.length,"Plist wrong length.")
    assert(plist.include?(1),"Parent ID 1 missing")
    assert(plist.include?(20),"Parent ID 20 missing")
    assert(plist.include?(4),"Missing project 4")
    assert(plist.include?(5),"Missing project 5")
    assert(plist.include?(6),"Missing project 6")
    assert(plist.include?(21),"Missing project 21")
    assert(plist.include?(22),"Missing project 22")
  end

end
