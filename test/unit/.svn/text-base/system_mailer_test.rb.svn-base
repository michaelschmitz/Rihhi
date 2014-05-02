require 'test_helper'

class SystemMailerTest < ActionMailer::TestCase
  test "registered" do
    @expected.subject = 'SystemMailer#registered'
    @expected.body    = read_fixture('registered')
    @expected.date    = Time.now

    assert_equal @expected.encoded, SystemMailer.create_registered(@expected.date).encoded
  end

  test "forgotten_pw" do
    @expected.subject = 'SystemMailer#forgotten_pw'
    @expected.body    = read_fixture('forgotten_pw')
    @expected.date    = Time.now

    assert_equal @expected.encoded, SystemMailer.create_forgotten_pw(@expected.date).encoded
  end

  test "ordered1" do
    @expected.subject = 'SystemMailer#ordered1'
    @expected.body    = read_fixture('ordered1')
    @expected.date    = Time.now

    assert_equal @expected.encoded, SystemMailer.create_ordered1(@expected.date).encoded
  end

  test "ordered2" do
    @expected.subject = 'SystemMailer#ordered2'
    @expected.body    = read_fixture('ordered2')
    @expected.date    = Time.now

    assert_equal @expected.encoded, SystemMailer.create_ordered2(@expected.date).encoded
  end

  test "ordered3" do
    @expected.subject = 'SystemMailer#ordered3'
    @expected.body    = read_fixture('ordered3')
    @expected.date    = Time.now

    assert_equal @expected.encoded, SystemMailer.create_ordered3(@expected.date).encoded
  end

  test "ordered4" do
    @expected.subject = 'SystemMailer#ordered4'
    @expected.body    = read_fixture('ordered4')
    @expected.date    = Time.now

    assert_equal @expected.encoded, SystemMailer.create_ordered4(@expected.date).encoded
  end

  test "sale1" do
    @expected.subject = 'SystemMailer#sale1'
    @expected.body    = read_fixture('sale1')
    @expected.date    = Time.now

    assert_equal @expected.encoded, SystemMailer.create_sale1(@expected.date).encoded
  end

  test "sale2" do
    @expected.subject = 'SystemMailer#sale2'
    @expected.body    = read_fixture('sale2')
    @expected.date    = Time.now

    assert_equal @expected.encoded, SystemMailer.create_sale2(@expected.date).encoded
  end

  test "sale3" do
    @expected.subject = 'SystemMailer#sale3'
    @expected.body    = read_fixture('sale3')
    @expected.date    = Time.now

    assert_equal @expected.encoded, SystemMailer.create_sale3(@expected.date).encoded
  end

  test "sale4" do
    @expected.subject = 'SystemMailer#sale4'
    @expected.body    = read_fixture('sale4')
    @expected.date    = Time.now

    assert_equal @expected.encoded, SystemMailer.create_sale4(@expected.date).encoded
  end

  test "draw" do
    @expected.subject = 'SystemMailer#draw'
    @expected.body    = read_fixture('draw')
    @expected.date    = Time.now

    assert_equal @expected.encoded, SystemMailer.create_draw(@expected.date).encoded
  end

end
