# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $(".bible_quote").each ->
    $.bible_api.get_quotes $(this).data("bible_links"), (data) =>
      # clear text
      $(this).html ""

      html = ""

      for quote in data
        html += "<p><ol start=\"#{quote.verses[0].number}\">"
        for verse in quote.verses
          html += "<li><quote>#{verse.text}</quote></li>"

        html += "</ol><strong>#{quote.quote_link}</strong></p>"

      $(this).append html

