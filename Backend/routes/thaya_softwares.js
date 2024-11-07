var express = require('express')

const {test} = require("../controllers/thayaSoftwareController")

var router = express.Router()
console.log(test)
router.get("/", test)

module.exports = router;