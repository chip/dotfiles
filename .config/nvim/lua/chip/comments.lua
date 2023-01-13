local ft = require('Comment.ft')

ft
 .set('racket', {';%s', ';%s*'})
 .set('scheme', {';%s', ';%s*'})

require('Comment').setup()
