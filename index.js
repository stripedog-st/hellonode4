const express = require('express')
const app = express()

app.get('/', (req, res) => res.send('This is Nevins R&D Node 4.'))

app.listen(8072, () => console.log('Example app listening on port 8072!'))