# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  load_quotes_to = (target, quote_link) ->
    $.bible_api.get_quotes quote_link, (data) =>
      # clear text
      target.html ""

      html = ""

      for quote in data
        html += "<p><ol start=\"#{quote.verses[0].number}\">"
        for verse in quote.verses
          html += "<li><quote>#{verse.text}</quote></li>"

        html += "</ol><strong>#{quote.quote_link}</strong></p>"

      target.append html

  # Display on show page
  $(".bible_quote").each ->
    load_quotes_to($($(this).data("target")), $(this).data("bible_links"))

  # Edit form
  $(".bible_links_field").bind "change", ->
    load_quotes_to($($(this).data("target")), $(this).val())

  $(".bible_links_field").each ->
    load_quotes_to($($(this).data("target")), $(this).val())

