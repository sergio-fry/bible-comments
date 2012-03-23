# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#= require jquery.mockjax

$ ->
  BIBLE_API_URL = "http://bible-api.heroku.com/bible/quote"

  $.mockjax {
    url: BIBLE_API_URL,
    responseTime: 750,
    response: (settings) ->
      settings.data.q

      this.responseText = []
      this.responseText.push {
        quote_link: settings.data.q,
        verses: [
          { number: 1, text: "И пошел Аврам, как сказал ему Господь; и с ним пошел Лот. Аврам был семидесяти пяти лет, когда вышел из Харрана." }
          { number: 2, text: "И взял Аврам с собою Сару, жену свою, Лота, сына брата своего, и все имение, которое они приобрели, и всех людей, которых они имели в Харране; и вышли, чтобы идти в землю Ханаанскую; и пришли в землю Ханаанскую." }
        ]
      }
  }


  $(".bible_quote").each ->
    $.getJSON BIBLE_API_URL, { q: $(this).data("bible_links") }, (data) =>
      # clear text
      $(this).html ""

      html = ""

      for quote in data
        html += "<p>"
        for verse in quote.verses
          html += "#{verse.number} #{verse.text}<br />"

        html += "<strong>#{quote.quote_link}</strong></p>"

      $(this).append html

