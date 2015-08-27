$ = require('jquery')

speaker1 = require('./cards/speaker1.jade')()
speaker2 = require('./cards/speaker2.jade')()
speaker3 = require('./cards/speaker3.jade')()

sponsor1 = require('./cards/sponsor1.jade')()
sponsor2 = require('./cards/sponsor2.jade')()
sponsor3 = require('./cards/sponsor3.jade')()

slack = require('./cards/slack.jade')()
raffle = require('./cards/raffle.jade')()
drinks = require('./cards/drinks.jade')()
speakersWanted = require('./cards/speakers-wanted.jade')()
sponsorsWanted = require('./cards/sponsors-wanted.jade')()

surge = require('./cards/community/surge.jade')()
nodeschool = require('./cards/community/nodeschool.jade')()

next = require('./cards/next.jade')()

cardInterval = 20

cardsHtml = [
  speaker1
  sponsor1
  drinks
  slack

  speaker2
  sponsor2
  speakersWanted
  # nodeschool
  # raffle

  # speaker3
  # sponsor3
  next
  sponsorsWanted
  surge
]

iCard = 0
cards = []

createCard = (html) ->
  card = $('<div/>').addClass 'card'
  card.html html
  return card

nextCard = ->
  return unless cards.length

  cards[iCard].fadeOut 'slow'

  iCard += 1
  iCard = 0 if iCard >= cards.length

  cards[iCard].fadeIn 'slow'


module.exports = ->
  container = $('<div/>')
  $('body').append(container)

  logo = document.createElement 'img'
  logo.src = '/img/logo.png'
  logo.classList.add 'logo'
  document.body.appendChild logo

  cards = cardsHtml.map (html) ->
    createCard html

  iCard = cards.length - 1

  for card in cards
    card.hide()
    container.append card

  nextCard()

  setInterval nextCard, cardInterval * 1000

document.addEventListener 'keyup', (evt) ->
  nextCard() if evt.keyIdentifier is 'Right'

h = (tag, className) ->
  el = document.createElement tag
  el.classList.add className
  return el
