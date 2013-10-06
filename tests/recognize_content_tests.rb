$:.unshift File.join(File.dirname(__FILE__),'..','lib')
require 'read_book'
require "test/unit"
$contents = '<hr>
<A name=8></a>v<br>
Contents<br>
First ........................................................................................ <A href="index.html#8">vii</a><br>
Second ........................................................................................ <A href="index.html#10">ix</a><br>
Third..................................................................................................... <A href="index.html#12">xi</a><br>
Chapter<br>
1: First chapter....................................................................... <A href="index.html#17">1</a><br>
Chapter 2: Second chapter .......................................................................<A href="index.html#18">2</a><br>
<hr>'

class RecognizeContentsTests < Test::Unit::TestCase
    def setup
        @c = ReadBook::RecognizeContents.new
    end
    def test_that_it_recognizes_simple_contents
        @c.familiar(ReadBook::ReadHtml.new($contents))
    end
    def test_should_not_recognize
        assert !@c.familiar?(ReadBook::ReadHtml.new("\ntext\ntext\n"+$contents)), 'should not look familiar'
    end
end
