require 'rubygems'
require 'watir'
require 'pry'
require 'nokogiri'
require 'open-uri'
require 'tempfile'

def page_opening
	browser = Watir::Browser.new(:chrome)
	browser.goto 'https://www.pagesjaunes.fr/'
	search_bar_what = browser.text_field(id: 'pj_search_quoiqui')
	search_bar_where = browser.text_field(id: 'pj_search_ou')
	search_bar_what.set(ARGV[0])
	search_bar_where.set(ARGV[1])
	search_bar_where.send_keys(:enter)
	sleep(2)
	t = Tempfile.new('temp_file_test_ruby')
	t.write(browser.html)
	doc = Nokogiri::HTML(t.open.read)
	puts doc.xpath('//span[@id="SEL-compteur"]').text
	t.close
	t.unlink
	binding.pry
	browser.driver.manage.timeouts.implicit_wait = 3
	browser.link(id: 'pagination-next').click
	while true
	end
end



page_opening


