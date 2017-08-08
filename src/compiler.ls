require! {
  pug
}

module.exports = (path, locals, options = pretty: yes)->
  pug.compile-file path, options
  |> -> it locals

