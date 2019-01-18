require 'rubygems'
require 'watir'
require 'pry'
require 'nokogiri'
require 'open-uri'

def page_opening
	browser = Watir::Browser.new(:chrome)
	browser.goto 'https://www.pagesjaunes.fr/'
	search_bar_what = browser.text_field(id: 'pj_search_quoiqui')
	search_bar_where = browser.text_field(id: 'pj_search_ou')
	search_bar_what.set(ARGV[0])
	search_bar_where.set(ARGV[1])
	search_bar_where.send_keys(:enter)
	sleep(10.0)
	#browser.driver.manage.timeouts.implicit_wait = 59
	#puts browser.html
	#puts browser.url.class
	#doc = open(browser.url)
	t = Tempfile.new
	t.write(browser.html)
	doc = Nokogiri::HTML(t)
	puts doc
	
	puts doc.xpath('//span[@id="SEL-compteur"]').text
	binding.pry
	browser.driver.manage.timeouts.implicit_wait = 3
	browser.link(id: 'pagination-next').click
	while true
	end
end

def page_opening_2
	doc = Nokogiri::HTML(open("https://www.starofservice.com/annubis/nord-pas-de-calais/nord/tourcoing"))
	puts doc.xpath('//body').text
end

page_opening

#Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36

