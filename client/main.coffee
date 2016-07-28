$ = require('jquery')

cardInterval = 20

cardsHtml = [
  require('./cards/coc.jade')()
  require('./cards/speaker1.jade')()
  require('./cards/drinks.jade')()

  require('./cards/sponsor1.jade')()
  require('./cards/slack.jade')()
  require('./cards/community/nodebots.jade')()

  require('./cards/speaker2.jade')()
  require('./cards/speakers-wanted.jade')()
  require('./cards/community/youtube.jade')()

  # require('./cards/community/nodeschool.jade')()
  require('./cards/community/hyperterm.jade')()

  require('./cards/sponsor2.jade')()
  require('./cards/community/fullstack-react.jade')()

  require('./cards/next.jade')()
  require('./cards/sponsors-wanted.jade')()
  require('./cards/community/surge.jade')()
  require('./cards/community/lunch.jade')()
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
  logo.src = '/img/jsla_152.png'
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
