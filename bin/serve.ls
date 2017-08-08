require! {
  express, fs, stylus, moment
  \prelude-ls : {map, replicate, pairs-to-obj, Obj}
  \../src/compiler.ls
}

express!
  ..listen 3000
  ..get \/, (req, res)->
    res.send compiler "#__dirname/../src/index.pug", {}
  ..get \/resume, (req, res)->
    err, css <- stylus.render (fs.read-file-sync "#__dirname/../src/resume.styl" .to-string!), filename: "style.css"
    path = "#__dirname/../src/resume.pug"
    locals = <[personal histories licenses requests]>
    |> map replicate 2
    |> pairs-to-obj
    |> Obj.map (-> "../data/#it.json")
      >> (-> delete require.cache.(require.resolve it); return it)
      >> require
    locals <<<
      photo: fs.read-file-sync "#__dirname/../data/photo.jpg"
        |> (.to-string \base64)
        |> (+) "data:image/jpeg;base64,"
      css: css
      now: moment!
      birthday: moment locals.personal.birthday
    res.send compiler path, locals
  ..get \/decision, (req, res)->
    err, css <- stylus.render (fs.read-file-sync "#__dirname/../src/decision-acceptance.styl" .to-string!), filename: "style.css"
    path = "#__dirname/../src/decision-acceptance.pug"
    locals = <[personal target seasonal_greetings]>
    |> map replicate 2
    |> pairs-to-obj
    |> Obj.map (-> "../data/#it.json")
      >> (-> delete require.cache.(require.resolve it); return it)
      >> require
    locals <<<
      css: css
      now: moment!
    res.send compiler path, locals

console.info "get ready."
console.info "access to http://localhost:3000/"

