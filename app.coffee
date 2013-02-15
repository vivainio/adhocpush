
###
Module dependencies.
###
ahpengine = require "./ahpengine.coffee"
coffee_script = require("coffee-script")
express = require("express")
routes = require("./routes")
messages = require "./routes/messages"
user = require("./routes/user")
http = require("http")
path = require("path")
app = express()
app.configure ->
  app.set "port", process.env.PORT or 3000
  app.set "views", __dirname + "/views"
  app.set "view engine", "jade"
  app.use express.favicon()
  app.use express.logger("dev")
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser("your secret here")
  app.use express.session()
  app.use app.router
  app.use express.static(path.join(__dirname, "public"))

app.configure "development", ->
  app.use express.errorHandler()

global.engine = new ahpengine.AhpEngine

app.get "/", routes.index
app.get "/users", user.list

app.get "/messages/:channel", messages.messages

http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")

