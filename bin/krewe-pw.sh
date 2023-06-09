node
bcrypt = require("bcrypt")
password = 'whatevs'
bcrypt.hash(password, 10).then(console.log)
