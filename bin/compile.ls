require! {
  fs
  \../src/compiler.ls
}

path = "#__dirname/../src/resume.pug"
locals =
  personal: require "../data/personal.json"

compiler path, locals
|> console.log

